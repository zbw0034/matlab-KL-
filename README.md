# matlab-KL-

1. 序列分辨率是416*240 (QQ附件BasketballPass_416x240_50.yuv)

2. 我们把图像划分成8*8块

3. 求第一张图片Y分量 (416*240Byte 数据量)输出：对应的KLT变换矩阵Q (64*64维的向量)
将矩阵Q，以及Qx的协方差矩阵打印输出