### 변수 ###

goods = "냉장고"
goods

# 변수 사용시 객체형태로 사용하는 것을 권장
goods.name = "냉장고"
goods.code = "ref001"
goods.price = 600000

goods.name

# 값을 대입할 때에는 = 보다는 <- 를 사용

goods.name <- "냉장고"
goods.code <- "ref001"
goods.price <- 600000

# 데이터 타입 확인
class(goods.name)
class(goods.price)
mode(goods.name)
mode(goods.price)

# 도움말 활용
help(sum)
?sum
args(sum)
example(sum)

#### 데이터 타입 ####
# 스칼라(0차원), 벡터(1차원),행렬(2차원), 데이터프레임(2차원),배열(3차원 이상), 리스트(3차원 이상)
#===============================================================
# 벡터
# ---------
# 1) 기본 자료 구조
# 2) 1차원 배열
# 3) 인덱스 접근
# 4) 동일한 자료형만 저장
# 5) c(), seq(), rep()

v <- c(1,2,3,4,5)
v
mode(v)
class(v)
(v <- c(1,2,3,4,5))
mode(c(1:5))
class(c(1,2,3,4,"5"))

#seq()
seq(seq(from=1, to=10, by=2)) # seq(1,10,2)

#rep()
rep(1:3,3)

#벡터의 접근
a <- c(1:50)
a[10:45]
a[10:(length(a)-5)]
a[10:length(a)-5]

b <- c(13, -5, 20:23, 12, -2:3)
b
b[1]
b[c(2,4)]
b[c(4,5:8,7)]
b[-1]
b[-2]
b[-c(2,4)]

# 집합 연산
x <- c(1,3,5,7)
y <- c(3,5)
union(x,y); setdiff(x,y); intersect(x,y)

# 컬럼명 지정
age <- c(30, 35, 40)
age
names(age) <- c("홍길동","임꺽정","신돌석")
age

# 특정 변수의 데이터 제거
age <- NULL
age

x <- (1:5)
x
#===========================================================

# 팩터(factor)
#---------------------
# 1) 범주형 데이터 타입

gender <- c("man","women","women","man","man")
gender
class(gender)
is.factor(gender)
plot(gender)

ngender <- as.factor(gender)
ngender
class(ngender)
mode(ngender)
is.factor(ngender)
plot(ngender)
table(ngender)

?factor
ofactor <- factor(gender, levels=c("women","man"),
                  ordered=TRUE)
ofactor

#======================================================
# 기본 자료형
# ------------------------
# numeric, character, factor, logical

# 특수 자료형
# -------------------------
# NA, NULL, NaN, Inf

#===================================================

# Matrix
# ----------------------
# 1) 행과 열의 2차원 배열
# 2) 동일한 데이터 타입만 저장 가능
# 3) matrix(), rbind(), cbind()

m <- matrix(c(1:5))
m

m <- matrix(c(1:11),nrow=2)
m
# 열 위주로 값이 채워진다
# 짝이 맞지 않는 경우 처음 값인 1이 채워진다

m <- matrix(c(1:11), nrow=2, byrow=T)
m
# 행 위주로 값이 채워진다

class(m)
mode(m)

# 행, 열을 합쳐서 생성
x1 <- c(3,4, 50:52)
x2 <- c(30,5,6:8,7,8)
x1
x2

mr <- rbind(x1, x2)
mr

mc <- cbind(x1, x2)
mc

# 외부 데이터 읽어들이기
aws = read.delim("../data/AWS_sample.txt",sep="#")
head(aws)

x1 <- aws[1:3, 2:4]
head(x1)

x2 <- aws[9:11,2:4]
x2
class(x2)

cbind(x1, x2)
rbind(x1, x2)
class(cbind(x1, x2))

# matrix 활용
x <- matrix(c(1:9), ncol=3)
x

length(x); nrow(x); ncol(x); dim(x)

# 컬럼명 지정
colnames(x) <- c("one","two","trhee")
x
class(x)

?apply
apply(x,1,max)
apply(x,2,max)
apply(x, 1, mean)
apply(x, 2, mean)

#=========================================================

# data.frame
# --------------------------
# 1) DB의 table과 유사
# 2) R에서 가장 많이 사용되는 구조
# 8) parkdomgmin babo
# 3) 컬럼 단위로 서로 다른 데이터 타입 사용 가능
# 4) data.frame(), read.csv(), read.delim(), read.table()
# 5) 박동민 바보

no <- c(1,2,3)
name <- c("hong","lee","kim")
pay <- c(150,250, 300)

emp <- data.frame(No=no, Name=name, Payment=payment=pay)
emp

# 외부 파일을 이용하여 데이터프레임 생성
getwd()
setwd("../data")
txtemp <- read.table("emp.txt", header=T,sep=" ")
txtemp
class(txtemp)

csvemp = read.csv("emp.csv")
csvemp

csvemp2 = read.csv("emp.csv",header=T, col.names=c("사번","이름","급여"))
csvemp2

csvemp3 = read.csv("emp2.csv",header=F, col.names=c("사번","이름","급여"))
csvemp3

View(csvemp3)

# 접근
csvemp3$사번
class(csvemp3$사번)
csvemp3[,1]

#데이터프레임의 구조 확인
str(csvemp3)

#기본 통계량 확인
summary(csvemp3)

# apply()
df <- data.frame(x=c(1:5), y=seq(2,10,2), z=c("a","b","c","d","e"))
df

apply(df[,c(1,2)],2,sum) #열의 합계
apply(df[,c(1,2)],1,sum) #행의 합계

# 데이터의 일부 추출
x1 <- subset(df, x>=3)
x1

x2 <- subset(df, x>=2, y<=6)
x2

# 병합
height <- data.frame(id=c(1,2), h=c(180,175))
weight <- data.frame(id=c(1,2), h=c(80,75))
user <- merge(height, weight, by.x="id",by.y="id")
user

#=================================================================
# array
# --------
# 행, 열, 면의 3차원 배열 형태의 객체 생성

v <- c(1:12)
arr <- array(v,c(3,2,3))
arr

arr[, ,1]
arr[, ,2]
arr[2, 2, 1] # 5
arr[2, 1, 2] # 8

#============================================================

# list
# ------------------
# 1) key와 value가 한쌍
# 2) python에서의 dict와 유사
# 3) list()

x0 <- 1
x1 <- data.frame(var1=c(1,2,3),var2=c('a','b','c'))
x2 <- matrix(c(1:12),ncol=2)
x3 <- array(1:20, dim=c(2,5,2))

x4 <- list(c1=x0, c2=x1, c3=x2, c4=x3)
x4

x4$c1
x4$c2

list1 <- list("lee","이순신",95)
list1
list1[1]
list1[[1]]

un <- unlist(list1)
un
class(un)

# apply : lapply(), sapply()
a <- list(c(1:5))
b <- list(c(6:10))
a
b

c <- c(a,b)
c
class(c)

x <- lapply(c, max)
x

y <- sapply(c, max)
y

#===============================================================

#### 기타 자료형 및 함수들 ####

# 날짜형
# --------------
Sys.Date()
Sys.time()

a <- "20/7/13"
a
class(a)

b <- as.Date(a)
class(b)

c <- as.Date(a, "%y/%m/%d")
c

#===============================================

# 문자열 처리 함수
# -------------------------

#stringr : 정규 표현식 활용
install.packages("stringr")
#library("패키지명"), require(패키지명)
library(stringr)

str1 <- "홍길동35이순신45임꺽정25"
str_extract(str1, "\\d{2}")
str_extract_all(str1, "\\d{2}")
class(str_extract_all(str1, "[1-9]{2}"))

str2 <- c("hongkd105leess1002you25TOM400강감찬2005")
# 세 자리 문자만 추출
str_extract(str2, "[a-zA-Z가-힣]{3}")
str_extract(str2, "[a-zA-Z가-힣]{3,}")
str_extract(str2, "[a-zA-Z가-힣]{3,5}")

str_length(str2)
length(str2)

str_locate(str2, "강감찬")

str_c(str2,"유비55")
str2

str3 <- c("hongkd105,leess1002,you25,TOM400,강감찬2005")
str_split(str3, ",")

# 기본 함수
sample = data.frame(c1=c("abc_sdfsdf","abc_kkdfsfdfd","ccd"),
                    c2=1:3)
sample

nchar(sample[1,1])
which(sample[,1]=="ccd")
toupper(sample[1,1])
toupper(sample[2,1])
substr(sample[,1], start=1, stop=2)

# 문자열 분리, 병합
install.packages("splitstackshape")
library(splitstackshape)
sample
cSplit(sample, splitCols="c1",sep="_")

paste0(sample[,1], sample[,2])

paste(sample[,1], sample[,2], sep="@@")





