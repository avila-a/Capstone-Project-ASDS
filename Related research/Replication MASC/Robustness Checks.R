#############################################################################################
############################# LEAVE ONE OUT ROBUSTNESS CHECK ################################
#############################################################################################
#Run "Implementation ECI" before
#Create matrix where to store the total, direct and indirect effects of all leaving-one-out 
#calculations (automatic):
tot_rob<-matrix(ncol=2)
dir_rob<-matrix(ncol=2)
ind_rob<-matrix(ncol=2)

#Implement the leaving-one-out calculations (some lines of the code require the user intervention):
for (y in controls){
  #Load the database:
  load("C:/Users/Alessandra/Documents/Dottorato/Visiting/data.RData")
  #Exclude one of the control unit (automatic) 
  controls2<-controls[!(controls==y)]
  data<-data[which(is.element(data[,col_id_num], controls2) | data[,1]==name_treat),]
  
  #Create a column with treatment status (automatic)
  data<-cbind(data, rep(0, nrow(data)))
  data[data[,col_id]==name_treat, ncol(data)]<-1
  
  #Add fake pre-treatment outcomes to optimize on pre-treatment mediator values (automatic) during 
  #the choice of matrix V
  #If it is decided to select the weights V to use manually skip these lines of code
  data<-data[which(data[,col_time]>=(T_in-delay) & data[,col_time]<=T_fi2),]
  data2<-data[which(data[,col_time]>=(T_in-delay) & data[,col_time]<=(T_fi-delay)),]
  data2[,Y]<-data2[,M]
  data2<-data2[order(data2[,col_id_num],data2[,col_time]),]
  data2[,col_time]<-rep((T_in-length(T_in:T_fi)-delay):(T_in-1-delay), length(controls)+1)
  data<-rbind(data2, data)
  data<-data[order(data[,col_id_num],decreasing=F),]
  remove(data2)
  
  #Fake starting time (automatic)
  #This starting time is required if the pre-treatment mediator values are added as fake
  #outcomes (see above), otherwise run the commented line below
  T_inf<-T_in-length(T_in:T_fi)-delay
  #T_inf<-T_in
  
  #Looking for the synthetic unit for the estimation of total effect (automatic):
  prepar<-dataprep(data, special.predictors=pretreat4, dependent=Y, unit.variable=col_id_num, controls.identifier = controls2, time.variable =col_time, treatment.identifier =data[data[,col_id]==name_treat & data[,col_time]==T_in,col_id_num], time.predictors.prior=c(T_inf:(T_in-delay-1), T_in:T_fi), time.optimize.ssr = c(T_inf:(T_in-delay-1), T_in:T_fi), time.plot=T_inf:T_fi2)
  sintetico4<-synth(data.prep.obj = prepar)
  #If the weights V are chosen manually run the commented line below rather than those above
  #sintetico4<-synth(data.prep.obj = prepar, custom.v=required weigths)
  
  #Creates the value to store the outcome (and the total effect) value (automatic)
  M1<-data[which(data[,ncol(data)]==1 & data[,col_time]>=T_in & data[,col_time]<=T_fi2), Y]
  M_synth<-c()
  for (u in controls2){
    M_synth<-cbind(M_synth, matrix(data[which(data[,col_id_num]==u & data[,col_time]>=T_in & data[,col_time]<=T_fi2), Y], ncol=1))
  }
  #Store the results in tot_rob (automatic)
  potenz1<-M1
  potenz2<-M_synth%*%sintetico4$solution.w
  tot<-potenz1-potenz2
  tot_rob<-rbind(tot_rob, cbind(tot, rep(y, length(T_in:T_fi2))))
  
  #DIRECT EFFECT
  #Use the same pre-treatment constraints (automatic)
  pretreat6<-pretreat4
  j<-1
  #Creates vectors to store the results (automatic)
  potenz1<-as.matrix(rep(NA, length(T_in:T_fi2)), nrow=length(T_in:T_fi), ncol=1)
  rownames(potenz1)<-T_in:T_fi2
  potenz2<-as.matrix(rep(NA, length(T_in:T_fi2)), nrow=length(T_in:T_fi), ncol=1)
  rownames(potenz2)<-T_in:T_fi2
  
  #Apply synth algorithm each post-treatment time period adding each time period an additional 
  #constraint on the mediator required for the time period of interest (i.e. given by the time 
  #period of interest minus the required delay) (automatic)
  for (i in (T_fi+1):T_fi2){
    
    #The weigths to select with V can be chosen adding the post-treatment mediator value as a 
    #fake outcome in the cross validation process if the following commented lines are run. If
    #this choice is made the commented synth function below has to be run instead than the 
    #non-commented ones 
    # data2<-data[which(data[,col_time]==(i-delay)),]
    # data2[,Y]<-data2[,M]
    # data2<-data2[order(data2[,col_id_num],data2[,col_time]),]
    # data2[,col_time]<-rep((T_in-length(T_in:T_fi)-delay-j), length(controls)+1)
    # databis<-rbind(data2, databis)
    # data<-data[order(data[,col_id_num],decreasing=F),]
    # remove(data2)
    # T_inf<-T_in-j
    
    #(automatic)
    pretreat6[[length(pretreat6)+1]]<-list(M, i-delay, "mean")
    prepar6<-dataprep(data, special.predictors=pretreat6, dependent=Y, unit.variable=col_id_num, controls.identifier = controls2, time.variable =col_time, treatment.identifier =data[data[,col_id]==name_treat & data[,col_time]==T_in,col_id_num], time.predictors.prior=c(T_inf:(T_in-delay-1), T_in:T_fi), time.optimize.ssr =c(T_inf:(T_in-delay-1), T_in:T_fi), time.plot=T_in:T_fi2)
    sintetico6<-synth(data.prep.obj = prepar6, custom.v =c((1/2)*as.numeric(sintetico4$solution.v),rep((1/(2*j)), j)))
    potenz1temp<-prepar6$Y1plot
    potenz2temp<-prepar6$Y0plot%*%sintetico6$solution.w
    potenz1[rownames(potenz1)==i]<-potenz1temp[rownames(potenz1temp)==i]
    potenz2[rownames(potenz2)==i]<-potenz2temp[rownames(potenz2temp)==i]
    j<-j+1
  }
  #(automatic)
  potenz1[rownames(potenz1)>=T_in & rownames(potenz1)<=T_fi]<-potenz1temp[rownames(potenz1temp)>=T_in & rownames(potenz1temp)<=T_fi]
  potenz2[rownames(potenz2)>=T_in & rownames(potenz2)<=T_fi]<-potenz2temp[rownames(potenz2temp)>=T_in & rownames(potenz2temp)<=T_fi]
  #(automatic)
  dir<-potenz1-potenz2
  dir_rob<-rbind(dir_rob, cbind(dir, rep(y, length(T_in:T_fi2))))
  ind<-tot-dir
  ind_rob<-rbind(ind_rob, cbind(ind, rep(y, length(T_in:T_fi2))))
}

#Drop the first "NA" row of the matrices containing the stored results (automatic):
tot_rob<-tot_rob[-1,]
dir_rob<-dir_rob[-1,]
ind_rob<-ind_rob[-1,]

#Plot leave-one-out total effect (automatic):
palette(c("aquamarine2", "aquamarine4", "azure3", "blue", "blue4", "blueviolet", "brown", "brown1", "burlywood3", "cadetblue", "cadetblue1", "cadetblue4", "chartreuse", "chartreuse4", "chocolate1", "coral", "darkgoldenrod1", "darkgoldenrod", "darkgreen", "darkmagenta", "darkolivegreen1", "darkred", "darksalmon", "deeppink1", "firebrick1", "yellow"))
plot((T_in-3):T_fi2, c(rep(NA, 3), tot1), ylim=c(min(tot_rob[,1], tot1), max(tot_rob[,1], tot1)), type="l", main="Leave-one-out Robustness Check", sub="Total Effect", xlab="Time", ylab="Y11-Y00", lwd=1.5)
for (y in controls){
  lines((T_in-3):T_fi2, c(rep(NA, 3), tot_rob[tot_rob[,2]==y,1]), add=TRUE, col=y, lwd=1.5)
}
#Use a number that is not contained in controls (it identifies the color of the actual MASC implementation):
colnumb<-6
#Add the line of the real estimation (automatic):
lines((T_in-3):T_fi2, c(rep(NA, 3), tot1), add=TRUE, col=colnumb, lwd=2.5)
#Load the database:
load("C:/Users/Alessandra/Documents/Dottorato/Visiting/data.RData")
#Add the legend (automatic):
legend(T_in-3, max(tot_rob[,1], tot1), c(as.character(data[which(is.element(data[,col_id_num], controls) & data[,col_time]==T_in),col_id]), name_treat),fill=c(controls, colnumb), bty="n")

#Plot leave-one-out direct effect (automatic):
plot((T_in-3):T_fi2,  c(rep(NA, 3),dir1),ylim=c(min(dir_rob[,1], dir1), max(dir_rob[,1], dir1)), type="l", main="Leave-one-out Robustness Check", sub="Direct Effect", xlab="Time", ylab="Y11-Y01", lwd=1.5)
for (y in controls){
  lines((T_in-3):T_fi2, c(rep(NA, 3),dir_rob[dir_rob[,2]==y,1]), add=TRUE, col=y, lwd=1.5)
}
#Use a number that is not contained in controls (it identifies the color of the actual MASC implementation):
colnumb<-6
#Add the line of the real estimation (automatic):
lines((T_in-3):T_fi2, c(rep(NA, 3),dir1), add=TRUE, col=colnumb, lwd=2.5)
#Add the legend (automatic):
legend(T_in-3, max(dir_rob[,1], dir1), c(as.character(data[which(is.element(data[,col_id_num], controls) & data[,col_time]==T_in),col_id]), name_treat),fill=c(controls, colnumb), bty="n")

#Plot leave-one-out indirect effect (automatic):
plot((T_in-3):T_fi2,  c(rep(NA, 3),ind1),ylim=c(min(ind_rob[,1], ind1), max(ind_rob[,1], ind1)), type="l", main="Leave-one-out Robustness Check", sub="Indirect Effect", xlab="Time", ylab="Y11-Y01", lwd=1.5)
for (y in controls){
  lines((T_in-3):T_fi2, c(rep(NA, 3),ind_rob[ind_rob[,2]==y,1]), add=TRUE, col=y, lwd=1.5)
}
#Use a number that is not contained in controls (it identifies the color of the actual MASC implementation):
colnumb<-6
#Add the line of the real estimation (automatic):
lines((T_in-3):T_fi2, c(rep(NA, 3),ind1), add=TRUE, col=colnumb, lwd=2.5)
#Add the legend (automatic):
legend(T_in-3, max(ind_rob[,1], ind1), c(as.character(data[which(is.element(data[,col_id_num], controls) & data[,col_time]==T_in),col_id]), name_treat),fill=c(controls, colnumb), bty="n")

palette("default")
