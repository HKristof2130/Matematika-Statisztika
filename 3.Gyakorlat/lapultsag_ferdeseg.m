%ferdes�g = skewness
%lapults�g = kurtosis �s el kell venni  3at vagy kurtosis(x,0) ez alapbol
%levonja a 3at

%egyenletes eloszl�s
X = rand(1000,1);
kurt_e = kurtosis(X)-3
skew_e = skewness(X)


%norm�lis eloszl�s
Y = randn(1000,1);
kurt_n = kurtosis(Y)-3
skew_n = skewness(Y)


%exponenci�lis eloszl�s
Z = exprnd(2,1000,1);
kurt_exp = kurtosis(Z)-3
skew_exp = skewness(Z)
