df = read.csv("CostMatrix - Sheet1.csv")
ismatch = function(A,B)
  df[df$X==A,B]
end
