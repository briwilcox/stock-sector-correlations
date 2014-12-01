#
# Copyright 2014 Brian Wilcox
# brianmwilcox.com
#
#
#
library(quantmod)
library(corrplot)

getSymbols("VCR", from="2006-01-01")
getSymbols("VDC", from="2006-01-01")
getSymbols("VDE", from="2006-01-01")
getSymbols("VFH", from="2006-01-01")
getSymbols("VHT", from="2006-01-01")
getSymbols("VIS", from="2006-01-01")
getSymbols("VGT", from="2006-01-01")
getSymbols("VAW", from="2006-01-01")
getSymbols("VNQ", from="2006-01-01")
getSymbols("VOX", from="2006-01-01")
getSymbols("VPU", from="2006-01-01")

monthlyStockReturns = data.frame(monthlyReturn(VCR),
                                   monthlyReturn(VDC),
                                   monthlyReturn(VDE),
                                   monthlyReturn(VFH),
                                   monthlyReturn(VHT),
                                   monthlyReturn(VIS),
                                   monthlyReturn(VGT),
                                   monthlyReturn(VAW),
                                   monthlyReturn(VNQ),
                                   monthlyReturn(VOX),
                                   monthlyReturn(VPU))

colnames(monthlyStockReturns) <- c("Consumer Discretionary", "Consumer Staples", "Energy",
                                     "Financials", "Health Care", " Industrials", "Information Technology", 
                                     "Materials", "REIT", "Telecommunication Services", "Utilities")

sectorcor <- cor(monthlyStockReturns)

corrplot(sectorcor, method="pie", title="\nPie chart of Stock Sector Correlations - BrianMWilcox.com")
corrplot(sectorcor, method="square", title="\nSquare chart of Stock Sector Correlations - BrianMWilcox.com")
corrplot(sectorcor, method="number", title="\nNumber chart of Stock Sector Correlations - BrianMWilcox.com")

