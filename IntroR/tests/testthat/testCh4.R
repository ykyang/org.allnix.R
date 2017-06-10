test_that("factors",{
  state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",
             "wa",  "wa", "qld", "vic", "nsw", "vic",
             "qld", "qld", "sa",  "tas", "sa",  "nt",
             "wa",  "vic", "qld", "nsw", "nsw", "wa",
             "sa",  "act", "nsw", "vic", "vic", "act")
  statef <- factor(state)
  #print(statef)
  # [1] tas sa  qld nsw nsw nt  wa  wa  qld vic nsw vic qld qld sa  tas sa  nt  wa
  # [20] vic qld nsw nsw wa  sa  act nsw vic vic act
  # Levels: act nsw nt qld sa tas vic wa

  #print(levels(statef))
  # [1] "act" "nsw" "nt"  "qld" "sa"  "tas" "vic" "wa"

  incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42,
               56, 61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48,
               52, 46, 59, 46, 58, 43)

  incmeans <- tapply(incomes, statef, mean)
  #print(incmeans)
  #      act      nsw       nt      qld       sa      tas      vic       wa
  # 44.50000 57.33333 55.50000 53.60000 55.00000 60.50000 56.00000 52.25000

  stdError <- function(x) sqrt(var(x)/length(x))
  incster <- tapply(incomes, statef, stdError)
  #print(incster)
  #      act      nsw       nt      qld       sa      tas      vic       wa
  # 1.500000 4.310195 4.500000 4.106093 2.738613 0.500000 5.244044 2.657536
})

test_that("factors in R", {
  # https://www.stat.berkeley.edu/classes/s133/factors.html
  data <- c(1,2,2,3,1,2,3,3,1,2,3,3,1)
  fdata <- factor(data)
  #print(fdata)
  # [1] 1 2 2 3 1 2 3 3 1 2 3 3 1
  # Levels: 1 2 3
  rdata = factor(data,labels=c("I","II","III"))
  #print(rdata)
  # [1] I   II  II  III I   II  III III I   II  III III I
  # Levels: I II III
  levels(fdata) <- c('I','II','III')
  #print(fdata)
  # [1] I   II  II  III I   II  III III I   II  III III I
  # Levels: I II III


  mons = c("March","April","January","November","January",
           "September","October","September","November","August",
           "January","November","November","February","May","August",
           "July","December","August","August","September","November",
           "February","April")
  fmons <- factor(mons)
  #print(fmons)
  # [1] March     April     January   November  January   September October
  # [8] September November  August    January   November  November  February
  # [15] May       August    July      December  August    August    September
  # [22] November  February  April
  # 11 Levels: April August December February January July March May ... September

  #print(table(fmons))
  # fmons
  # April    August  December  February   January      July     March       May
  # 2         4         1         2         3         1         1         1
  # November   October September
  # 5         1         3

  omons = factor(mons,levels=c("January","February","March",
                               "April","May","June","July","August","September",
                               "October","November","December"),ordered=TRUE)
  # March < April
  expect_true(omons[1] < omons[2])

  #print(omons)
  # [1] March     April     January   November  January   September October
  # [8] September November  August    January   November  November  February
  # [15] May       August    July      December  August    August    September
  # [22] November  February  April
  # 12 Levels: January < February < March < April < May < June < ... < December

  #expect_equal(omons[1], 3)
  #print(table(omons))
  # omons
  # January  February     March     April       May      June      July    August
  # 3         2         1         2         1         0         1         4
  # September   October  November  December
  # 3         1         5         1
  tmons <- table(omons)
  tmonsVec <- as.vector(tmons)
  tmonsName <- names(tmons)

  expect_equal(tmonsVec[1], 3) # January == 3
  expect_equal(tmonsName[1], "January")
  expect_equal(tmonsVec[12], 1) # December == 1
  expect_equal(tmonsName[12], "December")
})
