#############################################################################################
########################### GRAPHICAL PLACEBO TESTS AND PLACEBO #############################
################################ TEST ACROSS CONTROL UNITS ##################################
#############################################################################################

#Run "Implementation ECI" before

#Create matrix where to store the total, direct effects and all needed information of all 
#placebo implementations (automatic):
tot<-matrix(ncol=2)
dir<-matrix(ncol=2)
PRE_RMSPE_tot<-c()
POST_RMSPE_tot<-c()
PRE_RMSPE_dir<-c()
POST_RMSPE_dir<-c()
PRE_RMSPE_ind<-c()
POST_RMSPE_ind<-c()

#Implement the placebo calculations (some lines of the code require the user intervention):
for (i in controls3){
  #Load the database:
  load("C:/Users/Alessandra/Documents/Dottorato/Visiting/data2.RData")
  
  #Exclude the "treated" control unit from the control group and label it as treated (automatic):
  data<-data[which(is.element(data[,col_id_num], controls)),]
  controls2<-controls[!(controls==i)]
  data<-cbind(data, rep(0, nrow(data)))
  data[data[,col_id_num]==i, ncol(data)]<-1
  
  
  #Add fake pre-treatment outcomes to optimize on pre-treatment mediator values (automatic) during 
  #the choice of matrix V
  #If it is decided to select the weights V to use manually skip these lines of code
  data<-data[which(data[,col_time]>=(T_in-delay) & data[,col_time]<=T_fi2),]
  data2<-data[which(data[,col_time]>=(T_in-delay) & data[,col_time]<=(T_fi-delay)),]
  data2[,Y]<-data2[,M]
  data2<-data2[order(data2[,col_id_num],data2[,col_time]),]
  data2[,col_time]<-rep((T_in-length(T_in:T_fi)-delay):(T_in-1-delay), length(controls))
  data<-rbind(data2, data)
  data<-data[order(data[,col_id_num],decreasing=F),]
  remove(data2)
  
  #Fake starting time (automatic)
  T_inf<-T_in-length(T_in:T_fi)-delay
  #T_inf<-T_in
  
  
  #Looking for the synthetic unit for the estimation of total effect (automatic):
  prepar<-dataprep(data, special.predictors=pretreat4, dependent=Y, unit.variable=col_id_num, controls.identifier = controls2, time.variable =col_time, treatment.identifier =i, time.predictors.prior=c(T_inf:(T_in-delay-1), T_in:T_fi), time.optimize.ssr = c(T_inf:(T_in-delay-1), T_in:T_fi), time.plot=T_in:T_fi2)
  sintetico4<-synth(data.prep.obj = prepar)
  #If the weights V are chosen manually run the commented line below rather than those above
  #sintetico4<-synth(data.prep.obj = prepar, custom.v=required weigths)
  
  #Creates the value to store the outcome (and the total effect) value (automatic)
  M1<-data[which(data[,ncol(data)]==1 & data[,col_time]>=T_in & data[,col_time]<=T_fi2), Y]
  M_synth<-c()
  for (u in controls2){
    M_synth<-cbind(M_synth, matrix(data[which(data[,col_id_num]==u & data[,col_time]>=T_in & data[,col_time]<=T_fi2), Y], ncol=1))
  }
  #Store the results in tot (automatic)
  potenz1<-M1
  potenz2<-M_synth%*%sintetico4$solution.w
  tot<-rbind(tot, cbind(potenz1-potenz2, rep(i, length(T_in:T_fi2))))
  PRE_RMSPE_tot<-c(PRE_RMSPE_tot, mean((M1-M_synth%*%sintetico4$solution.w)[1:(length(T_in:T_fi))]^2))
  POST_RMSPE_tot<-cbind(POST_RMSPE_tot, (M1-M_synth%*%sintetico4$solution.w)[(length(T_in:T_fi)+1):length(T_in:T_fi2)])
  
  #DIRECT EFFECT
  #(automatic)
  pretreat6<-pretreat4
  j<-1
  potenz1bis<-as.matrix(rep(NA, length(T_in:T_fi2)), nrow=length(T_in:T_fi), ncol=1)
  rownames(potenz1bis)<-T_in:T_fi2
  potenz2bis<-as.matrix(rep(NA, length(T_in:T_fi2)), nrow=length(T_in:T_fi), ncol=1)
  rownames(potenz2bis)<-T_in:T_fi2
  for (t in (T_fi+1):T_fi2){
    
    #The weigths to select with V can be chosen adding the post-treatment mediator value as a 
    #fake outcome in the cross validation process if the following commented lines are run. If
    #this choice is made the commented synth function below has to be run instead than the 
    #non-commented ones 
    # data2<-data[which(data[,col_time]==(t-delay)),]
    # data2[,Y]<-data2[,M]
    # data2<-data2[order(data2[,col_id_num],data2[,col_time]),]
    # data2[,col_time]<-rep((T_in-length(T_in:T_fi)-delay-j), length(controls)+1)
    # databis<-rbind(data2, databis)
    # data<-data[order(data[,col_id_num],decreasing=F),]
    # remove(data2)
    # T_inf<-T_in-j
    
    #(automatic)
    pretreat6[[length(pretreat6)+1]]<-list(M, t-delay, "mean")
    prepar6<-dataprep(data, special.predictors=pretreat6, dependent=Y, unit.variable=col_id_num, controls.identifier = controls2, time.variable =col_time, treatment.identifier =i, time.predictors.prior=c(T_inf:(T_in-delay-1), T_in:T_fi), time.optimize.ssr =c(T_inf:(T_in-delay-1), T_in:T_fi), time.plot=T_in:T_fi2)
   sintetico6<-synth(data.prep.obj = prepar6, custom.v =c((1/2)*as.numeric(sintetico4$solution.v),rep((1/(2*j)), j)))
    potenz1temp<-prepar6$Y1plot
    potenz2temp<-prepar6$Y0plot%*%sintetico6$solution.w
    potenz1bis[rownames(potenz1bis)==t]<-potenz1temp[rownames(potenz1temp)==t]
    potenz2bis[rownames(potenz2bis)==t]<-potenz2temp[rownames(potenz2temp)==t]
    j<-j+1
  }
  #Store the results (automatic)
  potenz1bis[rownames(potenz1bis)>=T_in & rownames(potenz1bis)<=T_fi]<-potenz1temp[rownames(potenz1temp)>=T_in & rownames(potenz1temp)<=T_fi]
  potenz2bis[rownames(potenz2bis)>=T_in & rownames(potenz2bis)<=T_fi]<-potenz2temp[rownames(potenz2temp)>=T_in & rownames(potenz2temp)<=T_fi]
  PRE_RMSPE_dir<-c(PRE_RMSPE_dir, mean((potenz1bis-potenz2bis)[1:(length(T_in:T_fi))]^2))
  POST_RMSPE_dir<-cbind(POST_RMSPE_dir, (potenz1bis-potenz2bis)[(length(T_in:T_fi)+1):length(T_in:T_fi2)])
  
  #Store the results (automatic):
  ind<-((M1-M_synth%*%sintetico4$solution.w)-(potenz1bis-potenz2bis))
  PRE_RMSPE_ind<-c(PRE_RMSPE_ind, mean(ind[1:(length(T_in:T_fi))]^2))
  POST_RMSPE_ind<-cbind(POST_RMSPE_ind, ind[(length(T_in:T_fi)+1):length(T_in:T_fi2)])
  potenz1bis[rownames(potenz1bis)<=T_fi]<-potenz1temp[rownames(potenz1temp)<=T_fi]
  potenz2bis[rownames(potenz2bis)<=T_fi]<-potenz2temp[rownames(potenz2temp)<=T_fi]
  dir<-rbind(dir, cbind(potenz1bis-potenz2bis, rep(i, length(T_in:T_fi2))))
}

#Drop the lines with "NA" data (automatic):
tot<-tot[-1,]
dir<-dir[-1,]

#Plot the real total effect(red) together with the placebo total effects(black) (automatic) 
par(mfrow=c(1,1))
plot(T_in:T_fi2, tot1, type="l", col="red", ylim=c(min(tot, tot1)-sd(tot1), max(tot, tot1)+sd(tot1)), main="Placebo Test", sub="Total Effect", xlab="Time", ylab="Y11-Y00", lwd=2)
for (y in controls3){
  lines(T_in:T_fi2, tot[tot[,2]==y,1], add=TRUE, col="black")
}

#Plot the real direct effect(red) together with the placebo direct effects(black) (automatic) 
plot(T_in:T_fi2, dir1, type="l", col="red", ylim=c(min(dir, dir1)-sd(dir1), max(dir, dir1)+sd(dir1)), main="Placebo Test", sub="Direct Effect", xlab="Time", ylab="Y11-Y01", lwd=2)
for (y in controls3){
  lines(T_in:T_fi2, dir[dir[,2]==y,1], add=TRUE, col="black")
}

#Plot the real indirect effect(red) together with the placebo indirect effects(black) (automatic) 
ind<-cbind(tot[,1]-dir[,1], tot[,2])
plot(T_in:T_fi2, ind1, type="l", col="red", ylim=c(min(ind, ind1)-sd(ind1), max(ind, ind1)+sd(ind1)), main="Placebo Test", sub="Indirect Effect", xlab="Time", ylab="Y01-Y00", lwd=2)
for (y in controls3){
  lines(T_in:T_fi2, ind[ind[,2]==y,1], add=TRUE, col="black")
}


#Calculate the p-values according to Firpo & Possebom (2018) (automatic):
t_tot<-POST_RMSPE_tot/PRE_RMSPE_tot
t_dir<-POST_RMSPE_dir/PRE_RMSPE_dir
t_ind<-POST_RMSPE_ind/PRE_RMSPE_ind
t_tot1<-POST_RMSPE_tot1/PRE_RMSPE_tot1
t_dir1<-POST_RMSPE_dir1/PRE_RMSPE_dir1
t_ind1<-POST_RMSPE_ind1/PRE_RMSPE_ind1
tot_p<-matrix(c(POST_RMSPE_tot1[1], sum(abs(t_tot[1,])>abs(t_tot1[1]))/(length(t_tot[1,]))), ncol=2)
for (g in 2:nrow(t_tot)){
  tot_p<-rbind(tot_p, c(POST_RMSPE_tot1[g], sum(abs(t_tot[g,])>abs(t_tot1[g]))/(length(t_tot[g,]))))
}
dir_p<-matrix(c(POST_RMSPE_dir1[1], sum(abs(t_dir[1,])>abs(t_dir1[1]))/(length(t_dir[1,]))), ncol=2)
for (g in 2:nrow(t_dir)){
  dir_p<-rbind(dir_p, c(POST_RMSPE_dir1[g], sum(abs(t_dir[g,])>abs(t_dir1[g]))/(length(t_dir[g,]))))
}
ind_p<-matrix(c(POST_RMSPE_ind1[1], sum(abs(t_ind[1,])>abs(t_ind1[1]))/(length(t_ind[1,]))), ncol=2)
for (g in 2:nrow(t_ind)){
  ind_p<-rbind(ind_p, c(POST_RMSPE_ind1[g], sum(abs(t_ind[g,])>abs(t_ind1[g]))/(length(t_ind[g,]))))
}

#Return the calculated p-values (automatic):
tot_p
dir_p
ind_p

#############################################################################################
################################## IN-TIME PLACEBO ##########################################
#############################################################################################

#Run "Implementation ECI" before

#Create matrix where to store the total, direct effects and all needed information of all 
#placebo implementations (automatic):
tot_plac<-matrix(nrow=length(T_in:T_fi2))
dir_plac<-matrix(nrow=length(T_in:T_fi2))
ind_plac<-matrix(nrow=length(T_in:T_fi2))

#Implement the placebo calculations (some lines of the code require the user intervention):
#Set the years to make the placebo calculation on (in the example below the placebo period is 1979:1988)
for (t in (1979:1988)){
  #Load the database:
  load("C:/Users/Alessandra/Documents/Dottorato/Visiting/data.RData")

  data<-data[which(is.element(data[,col_id], controls_name) | data[,col_id]==name_treat),]
  #Starting pre-treatment period (automatic)
  T_in2<-t-(T_fi+1-T_in)
  #Ending pre-treatment period (automatic)
  T_fi3<-t-1
  #Ending post-treatment period (automatic)
  T_fi4<-t+(T_fi2-T_fi-1)
  
  #Create a column with treatment status (automatic)
  data<-cbind(data, rep(0, nrow(data)))
  data[data[,col_id]==name_treat, ncol(data)]<-1
  
  #Identifies donor pool in the numeric id column (automatic)
  controls<-data[!(data[,col_id]==name_treat) & data[,col_time]==T_in2, col_id_num]
  
  #Create all the required constraints (automatic the constraints on all pre-treatment
  #outcome until one year before intervention and pre-treatment mediator until two years 
  #before intervention)
  pretreat4<-list(list(Y, T_in2, "mean"))
  for (tt in c((T_in2+1):T_fi3)){
    pretreat4[[length(pretreat4)+1]]<-list(Y, tt, "mean")
  }
  for (tt in (T_in2-delay):(T_fi3-delay)){
    pretreat4[[length(pretreat4)+1]]<-list(M, tt, "mean")
  }
  
  #Add fake outcomes to optimize on pre-treatment mediator values (automatic)
  data<-data[which(data[,col_time]>=(T_in2-delay) & data[,col_time]<=T_fi4),]
  data2<-data[which(data[,col_time]>=(T_in2-delay) & data[,col_time]<=(T_fi3-delay)),]
  data2[,Y]<-data2[,M]
  data2<-data2[order(data2[,col_id_num],data2[,col_time]),]
  data2[,col_time]<-rep((T_in2-length(T_in2:T_fi3)-delay):(T_in2-1-delay), length(controls)+1)
  data<-rbind(data2, data)
  data<-data[order(data[,col_id_num],decreasing=F),]
  remove(data2)
  # # #
  # # # #Fake starting time (automatic)
  T_inf2<-T_in2-length(T_in2:T_fi3)-delay
  #T_inf<-T_in
  
  
  #Looking for the synthetic unit for the estimation of total effect (automatic):
  prepar<-dataprep(data, special.predictors=pretreat4, dependent=Y, unit.variable=col_id_num, controls.identifier = controls, time.variable =col_time, treatment.identifier =data[data[,col_id]==name_treat & data[,col_time]==T_in2,col_id_num], time.predictors.prior=c(T_inf2:(T_in2-delay-1), T_in2:T_fi3), time.optimize.ssr = c(T_inf2:(T_in2-delay-1), T_in2:T_fi3), time.plot=T_inf2:T_fi4)
  sintetico4<-synth(data.prep.obj = prepar)
  
  #Store the results (automatic)
  M1<-data[which(data[,ncol(data)]==1 & data[,col_time]>=T_in2 & data[,col_time]<=T_fi4), Y]
  M_synth<-c()
  for (u in controls){
    M_synth<-cbind(M_synth, matrix(data[which(data[,col_id_num]==u & data[,col_time]>=T_in2 & data[,col_time]<=T_fi4), Y], ncol=1))
  }
  potenz1<-M1
  potenz2<-M_synth%*%sintetico4$solution.w
  tot<-potenz1-potenz2
  tot_plac<-cbind(tot_plac, tot)
  
  #DIRECT EFFECT (automatic)
  pretreat6<-pretreat4
  j<-1
  potenz1<-as.matrix(rep(NA, length(T_in2:T_fi4)), nrow=length(T_in2:T_fi3), ncol=1)
  rownames(potenz1)<-T_in2:T_fi4
  potenz2<-as.matrix(rep(NA, length(T_in2:T_fi4)), nrow=length(T_in2:T_fi3), ncol=1)
  rownames(potenz2)<-T_in2:T_fi4
  for (i in (T_fi3+1):T_fi4){
    pretreat6[[length(pretreat6)+1]]<-list(M, i-delay, "mean")
    prepar6<-dataprep(data, special.predictors=pretreat6, dependent=Y, unit.variable=col_id_num, controls.identifier = controls, time.variable =col_time, treatment.identifier =data[data[,col_id]==name_treat & data[,col_time]==T_in2,col_id_num], time.predictors.prior=c(T_inf2:(T_in2-delay-1), T_in2:T_fi3), time.optimize.ssr =c(T_inf2:(T_in2-delay-1), T_in2:T_fi3), time.plot=T_in2:T_fi4)
    sintetico6<-synth(data.prep.obj = prepar6, custom.v =c((1/2)*as.numeric(sintetico4$solution.v),rep((1/(2*j)), j)))
    potenz1temp<-prepar6$Y1plot
    potenz2temp<-prepar6$Y0plot%*%sintetico6$solution.w
    potenz1[rownames(potenz1)==i]<-potenz1temp[rownames(potenz1temp)==i]
    potenz2[rownames(potenz2)==i]<-potenz2temp[rownames(potenz2temp)==i]
    j<-j+1
  }
  potenz1[rownames(potenz1)>=T_in2 & rownames(potenz1)<=T_fi3]<-potenz1temp[rownames(potenz1temp)>=T_in2 & rownames(potenz1temp)<=T_fi3]
  potenz2[rownames(potenz2)>=T_in2 & rownames(potenz2)<=T_fi3]<-potenz2temp[rownames(potenz2temp)>=T_in2 & rownames(potenz2temp)<=T_fi3]
  dir<-potenz1-potenz2
  dir_plac<-cbind(dir_plac, dir)
  ind<-tot-dir
  ind_plac<-cbind(ind_plac, ind)
  remove(data)
}

#Store the results (automatic):
tot_plac<-tot_plac[,2:ncol(tot_plac)]
dir_plac<-dir_plac[,2:ncol(dir_plac)]
ind_plac<-ind_plac[,2:ncol(ind_plac)]
PRE_RMSPE_ttemp<-colMeans(tot_plac[1:(length(T_in:T_fi)),]^2)
POST_RMSPE_ttemp<-colMeans(tot_plac[(length(T_in:T_fi)+1):length(T_in:T_fi2),]^2)
PRE_RMSPE_dtemp<-colMeans(dir_plac[1:(length(T_in:T_fi)),]^2)
POST_RMSPE_dtemp<-colMeans(dir_plac[(length(T_in:T_fi)+1):length(T_in:T_fi2),]^2)
PRE_RMSPE_itemp<-colMeans(ind_plac[1:(length(T_in:T_fi)),]^2)
POST_RMSPE_itemp<-colMeans(ind_plac[(length(T_in:T_fi)+1):length(T_in:T_fi2),]^2)
length(which((POST_RMSPE_ttemp/PRE_RMSPE_ttemp)>(POST_RMSPE_tot1/PRE_RMSPE_tot1)))/length(POST_RMSPE_ttemp)
length(which((POST_RMSPE_dtemp/PRE_RMSPE_dtemp)>(POST_RMSPE_dir1/PRE_RMSPE_dir1)))/length(POST_RMSPE_dtemp)
length(which((POST_RMSPE_itemp/PRE_RMSPE_itemp)>(POST_RMSPE_ind1/PRE_RMSPE_ind1)))/length(POST_RMSPE_itemp)
tot_plac<-tot_plac[(length(T_in:T_fi)+1):length(T_in:T_fi2),]
dir_plac<-dir_plac[(length(T_in:T_fi)+1):length(T_in:T_fi2),]
ind_plac<-ind_plac[(length(T_in:T_fi)+1):length(T_in:T_fi2),]
tot_p<-matrix(c(tot1[length(T_in:T_fi)+1], sum(abs(tot_plac[1,])>abs(tot1[length(T_in:T_fi)+1]))/(length(tot_plac[1,]))), ncol=2)
for (g in 2:nrow(tot_plac)){
  tot_p<-rbind(tot_p, c(tot1[length(T_in:T_fi)+g], sum(abs(tot_plac[g,])>abs(tot1[length(T_in:T_fi)+g]))/(length(tot_plac[g,]))))
}
dir_p<-matrix(c(dir1[length(T_in:T_fi)+1], sum(abs(dir_plac[1,])>abs(dir1[length(T_in:T_fi)+1]))/(length(dir_plac[1,]))), ncol=2)
for (g in 2:nrow(dir_plac)){
  dir_p<-rbind(dir_p, c(dir1[length(T_in:T_fi)+g], sum(abs(dir_plac[g,])>abs(dir1[length(T_in:T_fi)+g]))/(length(dir_plac[g,]))))
}
ind_p<-matrix(c(ind[length(T_in:T_fi)+1], sum(abs(ind_plac[1,])>abs(ind[length(T_in:T_fi)+1]))/(length(ind_plac[1,]))), ncol=2)
for (g in 2:nrow(ind_plac)){
  ind_p<-rbind(ind_p, c(ind[length(T_in:T_fi)+g], sum(abs(ind_plac[g,])>abs(ind[length(T_in:T_fi)+g]))/(length(ind_plac[g,]))))
}

#Display p-values
tot_p
dir_p
ind_p


