source("matchfun.R")
gap = -2

Seq.A <- "TTTTTATA"
Seq.B <- "ACAAAAAA" 

Seq.A = strsplit(Seq.A,"")[[1]]
Seq.B= strsplit(Seq.B,"")[[1]]

#creating the matrix:
m = length(Seq.A)
n = length(Seq.B)

matrix = array(dim = c(m+1, n+1)) #rows, columns

for (c in 0:m+1) 
  matrix[c,1] = (c-1)*gap

for (c in 0:n+1)
  matrix[1,c] = (c-1)*gap

for (x in 1:m+1){
  for (y in 1:n+1){
    add = ismatch(Seq.A[x-1], Seq.B[y-1])
    possibles = c(matrix[x-1,y]+gap, matrix[x,y-1]+gap, matrix[x-1,y-1]+add)
    matrix[x,y] = max(possibles)
  }
}

#backtracking
position = m+n #start at end, work to start
New.Seq.A = array(dim=c(1, position)) #associated with x
New.Seq.B = array(dim=c(1, position)) #associated with y

while (x > 1 || y > 1){
  best_move = matrix[x-1,y-1]
  next_x = x-1
  next_y = y-1
  if (length(best_move)==0){best_move = -.Machine$integer.max}
  
  if(length(matrix[x,y-1]) != 0 && matrix[x,y-1] > best_move){
    best_move = matrix[x,y-1]
    next_x = x
    next_y = y-1
    }
  if(length(matrix[x-1,y]) !=0 && matrix[x-1,y] > best_move){
    best_move = matrix[x-1,y]
    next_x = x-1
    next_y = y
  }
  
  #add to arrays.
  if(next_x == x-1){
    New.Seq.A[position] = Seq.A[x-1]
    x=x-1
  }
  else{New.Seq.A[position] = '-'}
  
  if(next_y == y-1){
    New.Seq.B[position] = Seq.B[y-1]
    y=y-1
  }
  else{New.Seq.B[position] = '-'}
  position = position -1
}

New.Seq.A = New.Seq.A[(position+1):length(New.Seq.A)]
New.Seq.B = New.Seq.B[(position+1):length(New.Seq.B)]

cat(New.Seq.A)
cat(New.Seq.B)

  
      
