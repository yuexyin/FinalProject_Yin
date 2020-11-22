#' This function helps filtering out the unstable data based on several
#' criteria.
#'
#' @param dataSet1 the original data file name
#' @param y_max the maximum y.frac value allowed
#' @param y_min the minimum y.frac value allowed
#' @param z_min the minimum z.plane value allowed
#' @param z_max the maximum z.plane value allowed
#' @param RD the criteria of resistance difference
#'
#' @return
#' @export
#'
#' @examples
#' ephysfilter(ephys)
ephysfilter <- function(dataSet1, y_max=0.6, y_min=0.4, z_min=35, z_max=75, RD=0.2)
  {
  ephys1 <- filter(dataSet1, y.frac < y_max, y.frac > y_min, z.plane > z_min, z.plane < z_max, Resistance.difference < RD)
  return(ephys1)
}


#' This function helps graph a ggviolin plot for data visualization.
#'
#' @param dataname the data file name
#' @param xname the treatment column name
#' @param yname the dependent variable
#' @param title the title of the plot
#'
#' @return
#' @export
#'
#' @examples
#' Thresholdplot(ephys1, "Treatment", "Voltage.threshold.mV", "Voltage Threshold (mV)")
Thresholdplot <- function (dataname, xname, yname, title)
{
  ggviolin(dataname, x = xname, y = yname, aplha = 0.3, add = "boxplot", fill = xname, title = title)
}



#' This function helps create a statistical table of mean and STD.
#'
#' @param Dataname the filtered data file name
#' @param treatment1 the treatment name
#' @param treatment2 the other treatment name
#' @param ID cell ID
#' @param DependentVar the column name of the dependent variable
#'
#' @return
#' @export
#'
#' @examples
#' StatsTable(ephys1, "alcohol", "water", "Cell.ID", "Voltage.threshold.mV")
StatsTable <- function(Dataname, treatment1, treatment2, ID, DependentVar)
{
  Group1 <- Dataname %>% filter(Treatment==treatment1)
  Group1a <- Group1[,c(ID, DependentVar)]
  Group2 <- Dataname %>% filter(Treatment==treatment2)
  Group2a <- Group2[,c(ID, DependentVar)]
  Group1stats <- c(mean(Group1a[,DependentVar]), sd(Group1a[,DependentVar], na.rm=TRUE))
  names(Group1stats) <- c("Mean", "STD")
  Group2stats <- c(mean(Group2a[,DependentVar]), sd(Group2a[,DependentVar], na.rm=TRUE))
  names(Group2stats) <- c("Mean", "STD")
  ThreTable <- rbind(Group1stats, Group2stats)
  ThreTable <- as.data.frame(ThreTable)
  return(ThreTable)
}


#' This function helps visualize the distribution of the data
#'
#' @param Dataname the filtered data file name
#' @param treatment the name of the treatment
#' @param DependentVar the name of the dependent variable
#' @param yname the y-axis title for the output qqplot
#'
#' @return
#' @export
#'
#' @examples
#' normaldisplot(ephys1, "alcohol", "Voltage.threshold.mV", "Voltage Threshold (mV)")
normaldisplot<- function(Dataname, treatment, DependentVar, yname)
{
  Group <- Dataname %>% filter(Treatment==treatment)
  ggqqplot (Group[,DependentVar], ylab = yname, ggtheme = theme_minimal())
}


#' This function helps determine the normalization and homogeneity of the data.
#'
#' @param Dataname the filtered data file name
#' @param DependentVar the dependent variable name
#' @param Treatmentname the treatment group name
#'
#' @return
#' @export
#'
#' @examples
#' normalization(ephys1, "Voltage.threshold.mV", "alcohol")
normalization <- function(Dataname, DependentVar, Treatmentname)
{
  shapirotest<-with(Dataname, shapiro.test(get(DependentVar)[Treatment==Treatmentname]))
  ftest<-var.test(get(DependentVar) ~ Treatment, data = Dataname)
  mylist <- list(shapirotest, ftest)
  return(mylist)
}


#' This function helps calculate the p-value of the t-test.
#'
#' @param DependentVar the column name of the dependent variable
#' @param dataname the filtered data name
#'
#' @return
#' @export
#'
#' @examples
#' threshttest("Voltage.threshold.mV", ephys1)
threshttest <- function (DependentVar, dataname)
{
  ttestthre <- t.test(get(DependentVar) ~ Treatment, data = dataname, var.equal = TRUE)
  return(ttestthre$p.value)
}

