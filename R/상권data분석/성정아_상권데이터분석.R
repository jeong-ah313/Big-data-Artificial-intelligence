# 빅데이터 창업인재 양성과정 #

## 서울시 상권데이터 분석 사례 - 관광활성화지수 ##

#### 실습 방법: 작성된 코드를 줄(line) Ehsms wntjrdmfh rnqnsehlwl dksgdms
    #문장/코드 단위로 선택 후 ctrl+enter키를 누르거나 화면 상단의 run아이콘 클릭

# 작업폴더(Working Directory)확인 후 변경
getwd()
setwd("C:/Users/user/Documents/R")

# 1.데이터 불러오기
install.packages("readxl")
library(readxl)

## 데이터 셋 파일이  "C:/Users/user/Documents/R" 폴더에 저장되어야 실행 가능합니다.
  #제가 R을 전에 깐 위치에 dataset을 위치시켜주었습니다.
dataset<-read_excel("dataset.xlsx")

View(dataset)

str(dataset)
summary(dataset)

#2. 단계 구분 및 단계정보 입력
install.packages("classInt")
library(classInt)
a<-classIntervals(dataset$IDEX_VALUE, n=4, style="jenks")

help(classIntervals)

q<-as.data.frame(a[2])

#빠르게 확인
#q[2, 1]

#지표코딩 기준: "A"가 가장 활성도가 높음
dataset$IDEX_CD<-ifelse(dataset$IDEX_VALUE<=q[2,1], "D",
                        ifelse(dataset$IDEX_VALUE<=q[3, 1], "C",
                        ifelse(dataset$IDEX_VALUE<=q[4, 1], "B",
                        "A")))

#등급이 입력된 결과를 확인
View(dataset)
summary(dataset)

#3.데이터출력(export)
# 해당 코드를 실행 한 뒤 지정폴더에 파일이 저장되었는지 확인
#저는 제 컴퓨터 상에 R이 저장된 위치에 파일을 저장하였습니다.
write.table(dataset, file = "C:/Users/user/Documents/R/result_value.csv", sep =",", row.names = F)
