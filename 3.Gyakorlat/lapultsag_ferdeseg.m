%ferdeség = skewness
%lapultság = kurtosis és el kell venni  3at vagy kurtosis(x,0) ez alapbol
%levonja a 3at

%egyenletes eloszlás
X = rand(1000,1);
kurt_e = kurtosis(X)-3
skew_e = skewness(X)


%normális eloszlás
Y = randn(1000,1);
kurt_n = kurtosis(Y)-3
skew_n = skewness(Y)


%exponenciális eloszlás
Z = exprnd(2,1000,1);
kurt_exp = kurtosis(Z)-3
skew_exp = skewness(Z)
