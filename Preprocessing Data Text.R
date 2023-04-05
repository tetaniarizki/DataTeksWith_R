#import file
data <- read.table(
  file='https://storage.googleapis.com/dqlab-dataset/datalahir_teks_dqlab.txt',
  header=FALSE,
  sep='\n',
  na.strings=c('NA','N/A',''),
  col.names='data_list',
  skip=1
) 

#display the top 5 data
head(data,5)

#splitting data using strsplit
data <- strsplit(data$data_list, split='|||', fixed=TRUE)

#convert data to dataframe
data <- data.frame(matrix(unlist(data), nrow=length(data), byrow=TRUE))

#Give each column a name
colnames(data) <- c('Name', 'PlaceOf_birth', 'DateOf_birth', 'Province')

#Add new column containing place of birth and province
data$City_AndProvince <- paste(data$PlaceOf_birth, ',', data$Province)

#search for names that contain numbers
name_with_num <- grep('\\d+', data$Name)
name_with_num
#displays name data containing numbers
data[name_with_num,]

#remove characters that are not include in the alphabet in the name column
data$Name <- gsub('[^A-Za-z]','',data$Name) 

#display the top 5 data
head(data,5)

summary(data)

write.csv(data, 'E:\\STATISTIKA-ITS\\Portofolio\\DQLAB\\R\\Statistics using R for Data Science\\data.csv', row.names=FALSE)