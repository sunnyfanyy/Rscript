####假设我有一批文件需要读取，单个读入如下：
d48 = read.csv("48.FPKM_TPM.sorted", sep="\t",row.names = "transcript_id")
d49 = read.csv("49.FPKM_TPM.sorted", sep="\t",row.names = "transcript_id")
#...
d59 = read.csv("59.FPKM_TPM.sorted", sep="\t",row.names = "transcript_id")
 
all(rownames(d48) ==rownames(d51))
all=cbind(d48,d49,d50,d51,d52,d53,d54,d55,d56,d57,d58,d59)
 
# 当使用write.table命令时，col.names=NA，那么第一行就会空出一个位置，就不会造成第一列左移
write.table(all, file="all_FPKM_TPM.txt", quote=F, sep = "\t",col.names=NA)

###单个读入需要重复输入一批代码，而批量读入文件只需要for循环+assign函数+paste函数：
for(i in 48:59)
{
        assign(paste("d",i,sep=""), read.csv(paste(i,".FPKM_TPM.sorted",sep=""), sep = "\t", row.names = "transcript_id"))
}
 
# 查看读入的文件
head(d48)
head(d59)

###So easy~~~~~ ^_^