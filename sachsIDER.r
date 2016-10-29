# #2-component example, written out and then with functions that work for any number of components
# a=c(-1,3.5)
# #coeff1=1/c(1-a[2]/a[1],1-a[1]/a[2])#next line suggested by Bing. also Works but I don't understand why the heck it does.
# coeff=1/sapply(1:length(a), function(i) prod(-a[-i]/a[i]+1))
# E=.1*(1:7)
## dose1=(coeff[1]/a[1])*log(1+a[1]*E)+(coeff[2]/a[2])*log(1+a[2]*E)#the next, suggested by Bing, works. Why?
# dose=colSums(c(rep(1, length(a)))*coeff/a*t(sapply(a, function(i) log(1 + i*E))))
# dose2=c(0,dose[-7])
# slope=dose-dose2 
# plot(E,slope,type="l")
# plot(E,dose,type='l')
# lines(c(0,.7),c(0,dose[7]),col='red')#the red line is a straight line
# #All above looks OK, mostly checked by explicit calculations on paper or estumates


# a=c(-1,-2,5)#Check that general coeff and dose also work for 3 components
# coeff=1/sapply(1:length(a), function(i) prod(-a[-i]/a[i]+1))
# coeff1=1/c((1-a[2]/a[1])*(1-a[3]/a[1]),(1-a[1]/a[2])*(1-a[3]/a[2]),(1-a[1]/a[3])*(1-a[2]/a[3]))
# E=.01*(1:49)
# dose=colSums(c(rep(1, length(a)))*coeff/a*t(sapply(a, function(i) log(1 + i*E))))
# dose1=(coeff[1]/a[1])*log(1+a[1]*E)+(coeff[2]/a[2])*log(1+a[2]*E)+(coeff[3]/a[3])*log(1+a[3]*E)
# dose/dose1
# coeff/coeff1


#In geneeral, a is a vector of non-zero real numbers all different from each other.
a=c(-1,.5,.2,.30)
coeff=1/sapply(1:length(a), function(i) prod(-a[-i]/a[i]+1))
#coeff1=1/c((1-a[2]/a[1])*(1-a[3]/a[1])*(1-a[4]/a[1]),(1-a[1]/a[2])*(1-a[3]/a[2])*(1-a[4]/a[2]),
#          (1-a[1]/a[3])*(1-a[2]/a[3])*(1-a[4]/a[3]),(1-a[1]/a[4])*(1-a[2]/a[4])*(1-a[3]/a[4]))
E=.01*(1:99)
dose=colSums(c(rep(1, length(a)))*coeff/a*t(sapply(a, function(i) log(1 + i*E))))
#dose1=(coeff[1]/a[1])*log(1+a[1]*E)+(coeff[2]/a[2])*log(1+a[2]*E)+(coeff[3]/a[3])*log(1+a[3]*E)+
#   (coeff[4]/a[4])*log(1+a[4]*E)
dose2=c(0,dose[-66])
slope=dose-dose2 
plot(E,slope,type="l")
plot(dose,E,type='l')
#lines(c(0,.7),c(0,dose[66]),col='red')#the red line is a straight line
