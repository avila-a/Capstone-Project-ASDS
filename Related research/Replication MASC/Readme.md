# Notes on MASC and Pasquini and Mellace work:



## Email:

Dear Antonio,

thanks for writing us. Your idea for the dissertation sounds very 
interesting! And I think MASC will fit your needs.
Here attached you will find the code to implement MASC. You will be 
the first one using it besides me (although I implemented it with 
different databases), so please let me know if there is anything 
unclear or a bug.

The file "Implementation ECI" contains the general implementation.
The file "Robustness Checks" contains the code for the leave-one-out 
robustness check.
The file "Placebo Test Final2" contains the code to do both the 
in-space placebo and the in-time placebo.

in all files there are some commented lines explaining what you do 
running the following ones. You will see that some of the commented 
lines report the word "(automatic)". It means that the following lines 
do not need to be modified by the user. Otherwise, your intervention 
is required.

We thought about writing a command in STATA or a package in R, however 
as the computational difference between synth and our code is small we 
are not sure it is worth it. Probably it would be better to modify 
"synth" package to implement MASC.

Let me know if you need any help,

Alessandra Pasquini

P.S. Please keep in mind that we are working on a new version of the 
paper where we will discuss more in detail the underlying assumptions.