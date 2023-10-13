library('QuantumOps')
a <- ket(sqrt(0.6), sqrt(0.4))
epr <- ket(sqrt(1/2), 0, 0, sqrt(1/2))
combined <- tensor(a, epr)
print(dirac(combined))
cnot <- controlled(gate = X(), n=3, cQubits = 0, tQubit =1)
s1 <- cnot %*% combined
print(dirac(s1))
plotprobs(s1)
had <- H()
s2 <- tensor(had, had, had) %*% s1
print(dirac(s2))
plotprobs(s2)
s3 <- measure(s2)
print(dirac(s3[[1]]))
plotprobs(s3[[1]])
corrx <- tensor(X(), X(), X())
corrz <- tensor(Z(), Z(), Z())
if (s3[[2]] == 1)
  {
    s2 <- corrz %*% s2
    print(dirac(s2))
    plotprobs(s2)

  }
if(s3[[1]] == 1)

  {
    s2 <- corrx %*% s2
    print(dirac(s2))
    plotprobs(s2)

  }

