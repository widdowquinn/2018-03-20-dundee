# Script for exploring data structures

# Load cat data as a dataframe
cats <- read.csv(file = "data/feline_data.csv")

# Create data frame
df <- data.frame(a=c(1, 2, 3), b=c("huey", "dewey", "louie"),
                 c=c(TRUE, FALSE, TRUE))

# Write df to file
write.table(df, "data/df_example.tab", sep="\t")

# Load gapminder data from file
gapminder <- read.table("data/gapminder-FiveYearData.csv", sep=",",
                        header=TRUE)

# Load ggplot2
library(ggplot2)

# Plot with base graphics
plot(gapminder$lifeExp, gapminder$gdpPercap, col=gapminder$continent)

# Plot with ggplot
qplot(lifeExp, gdpPercap, data=gapminder, colour=continent)

# Generate plot of GDP per capita vs life Expectancy
p <- ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap))
p <- p + geom_point(alpha=0.4, aes(colour=continent))
p + scale_y_log10() + geom_density_2d()

# Plot life expectancy vs year
p <- ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=continent))
p <- p + geom_line(aes(group=country)) + scale_y_log10()
p + facet_wrap(~continent)

# Plot GDP against population
p <- ggplot(data=gapminder, aes(x=pop, y=gdpPercap))
p <- p + geom_point(alpha=0.8, aes(color=continent))
p <- p + scale_x_log10() + scale_y_log10()
p <- p + geom_density_2d(alpha=0.5)
p <- p + facet_wrap(~year)
p

# Filter and select data
df <- gapminder %>% 
  filter(continent=="Europe") %>%
  select(year, country, gdpPercap)

# Life expecancy , country, year for African nations
df <- gapminder %>% filter(continent=="Africa") %>%
  select(lifeExp, country, year)

# Mean GDP by year
gapminder %>% group_by(continent, year) %>% summarize(meanGDP=mean(gdpPercap))

# Calculate GDP per billion people
gdp_bill <- gapminder %>% mutate(gdp_billion = gdpPercap * pop/10^9)

