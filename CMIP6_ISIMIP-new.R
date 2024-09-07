library(raster)
library(gimms)
library(tidyverse)
library(SPEI)

####2021-2030####
###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP126 <- raster("MAT/GFDL_ESM4_SSP126/2021-2030_All.tif")
MAT_IPSL_CM6A_LR_SSP126 <- raster("MAT/IPSL_CM6A_LR_SSP126/2021-2030_All.tif")
MAT_MPI_ESM1_2_HR_SSP126 <- raster("MAT/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif")
MAT_MRI_ESM2_0_SSP126 <- raster("MAT/MRI_ESM2_0_SSP126/2021-2030_All.tif")
MAT_UKESM1_0_LL_SSP126 <- raster("MAT/UKESM1_0_LL_SSP126/2021-2030_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP126 <- resample(MAT_GFDL_ESM4_SSP126,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP126 <- resample(MAT_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP126 <- resample(MAT_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAT_MRI_ESM2_0_SSP126 <- resample(MAT_MRI_ESM2_0_SSP126,soil.biodiversity)
MAT_UKESM1_0_LL_SSP126 <- resample(MAT_UKESM1_0_LL_SSP126,soil.biodiversity)


MAT_SSP126 <- (MAT_GFDL_ESM4_SSP126+MAT_IPSL_CM6A_LR_SSP126+MAT_MPI_ESM1_2_HR_SSP126+
                 MAT_MRI_ESM2_0_SSP126+MAT_UKESM1_0_LL_SSP126)/5
writeRaster(MAT_SSP126,"E:/Data/Raster/CC-raster/MAT_SSP126_2021-2030-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP126 <- raster("MAP/GFDL_ESM4_SSP126/2021-2030_All.tif")
MAP_IPSL_CM6A_LR_SSP126 <- raster("MAP/IPSL_CM6A_LR_SSP126/2021-2030_All.tif")
MAP_MPI_ESM1_2_HR_SSP126 <- raster("MAP/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif")
MAP_MRI_ESM2_0_SSP126 <- raster("MAP/MRI_ESM2_0_SSP126/2021-2030_All.tif")
MAP_UKESM1_0_LL_SSP126 <- raster("MAP/UKESM1_0_LL_SSP126/2021-2030_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP126 <- resample(MAP_GFDL_ESM4_SSP126,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP126 <- resample(MAP_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP126 <- resample(MAP_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAP_MRI_ESM2_0_SSP126 <- resample(MAP_MRI_ESM2_0_SSP126,soil.biodiversity)
MAP_UKESM1_0_LL_SSP126 <- resample(MAP_UKESM1_0_LL_SSP126,soil.biodiversity)


MAP_SSP126 <- (MAP_GFDL_ESM4_SSP126+MAP_IPSL_CM6A_LR_SSP126+MAP_MPI_ESM1_2_HR_SSP126+
                 MAP_MRI_ESM2_0_SSP126+MAP_UKESM1_0_LL_SSP126)/5
writeRaster(MAP_SSP126,"E:/Data/Raster/CC-raster/MAP_SSP126_2021-2030-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP126 <- raster("AI/GFDL_ESM4_SSP126/2021-2030_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- raster("AI/IPSL_CM6A_LR_SSP126/2021-2030_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- raster("AI/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif")
AI_MRI_ESM2_0_SSP126 <- raster("AI/MRI_ESM2_0_SSP126/2021-2030_All.tif")
AI_UKESM1_0_LL_SSP126 <- raster("AI/UKESM1_0_LL_SSP126/2021-2030_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP126 <- resample(AI_GFDL_ESM4_SSP126,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP126 <- resample(AI_IPSL_CM6A_LR_SSP126,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP126 <- resample(AI_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
AI_MRI_ESM2_0_SSP126 <- resample(AI_MRI_ESM2_0_SSP126,soil.biodiversity)
AI_UKESM1_0_LL_SSP126 <- resample(AI_UKESM1_0_LL_SSP126,soil.biodiversity)


AI_SSP126 <- (AI_GFDL_ESM4_SSP126+AI_IPSL_CM6A_LR_SSP126+AI_MPI_ESM1_2_HR_SSP126+
                AI_MRI_ESM2_0_SSP126+AI_UKESM1_0_LL_SSP126)/5
writeRaster(AI_SSP126,"E:/Data/Raster/CC-raster/AI_SSP126_2021-2030-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP370 <- raster("MAT/GFDL_ESM4_SSP370/2021-2030_All.tif")
MAT_IPSL_CM6A_LR_SSP370 <- raster("MAT/IPSL_CM6A_LR_SSP370/2021-2030_All.tif")
MAT_MPI_ESM1_2_HR_SSP370 <- raster("MAT/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif")
MAT_MRI_ESM2_0_SSP370 <- raster("MAT/MRI_ESM2_0_SSP370/2021-2030_All.tif")
MAT_UKESM1_0_LL_SSP370 <- raster("MAT/UKESM1_0_LL_SSP370/2021-2030_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP370 <- resample(MAT_GFDL_ESM4_SSP370,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP370 <- resample(MAT_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP370 <- resample(MAT_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAT_MRI_ESM2_0_SSP370 <- resample(MAT_MRI_ESM2_0_SSP370,soil.biodiversity)
MAT_UKESM1_0_LL_SSP370 <- resample(MAT_UKESM1_0_LL_SSP370,soil.biodiversity)


MAT_SSP370 <- (MAT_GFDL_ESM4_SSP370+MAT_IPSL_CM6A_LR_SSP370+MAT_MPI_ESM1_2_HR_SSP370+
                 MAT_MRI_ESM2_0_SSP370+MAT_UKESM1_0_LL_SSP370)/5
writeRaster(MAT_SSP370,"E:/Data/Raster/CC-raster/MAT_SSP370_2021-2030-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP370 <- raster("MAP/GFDL_ESM4_SSP370/2021-2030_All.tif")
MAP_IPSL_CM6A_LR_SSP370 <- raster("MAP/IPSL_CM6A_LR_SSP370/2021-2030_All.tif")
MAP_MPI_ESM1_2_HR_SSP370 <- raster("MAP/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif")
MAP_MRI_ESM2_0_SSP370 <- raster("MAP/MRI_ESM2_0_SSP370/2021-2030_All.tif")
MAP_UKESM1_0_LL_SSP370 <- raster("MAP/UKESM1_0_LL_SSP370/2021-2030_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP370 <- resample(MAP_GFDL_ESM4_SSP370,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP370 <- resample(MAP_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP370 <- resample(MAP_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAP_MRI_ESM2_0_SSP370 <- resample(MAP_MRI_ESM2_0_SSP370,soil.biodiversity)
MAP_UKESM1_0_LL_SSP370 <- resample(MAP_UKESM1_0_LL_SSP370,soil.biodiversity)


MAP_SSP370 <- (MAP_GFDL_ESM4_SSP370+MAP_IPSL_CM6A_LR_SSP370+MAP_MPI_ESM1_2_HR_SSP370+
                 MAP_MRI_ESM2_0_SSP370+MAP_UKESM1_0_LL_SSP370)/5
writeRaster(MAP_SSP370,"E:/Data/Raster/CC-raster/MAP_SSP370_2021-2030-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP370 <- raster("AI/GFDL_ESM4_SSP370/2021-2030_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- raster("AI/IPSL_CM6A_LR_SSP370/2021-2030_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- raster("AI/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif")
AI_MRI_ESM2_0_SSP370 <- raster("AI/MRI_ESM2_0_SSP370/2021-2030_All.tif")
AI_UKESM1_0_LL_SSP370 <- raster("AI/UKESM1_0_LL_SSP370/2021-2030_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP370 <- resample(AI_GFDL_ESM4_SSP370,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP370 <- resample(AI_IPSL_CM6A_LR_SSP370,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP370 <- resample(AI_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
AI_MRI_ESM2_0_SSP370 <- resample(AI_MRI_ESM2_0_SSP370,soil.biodiversity)
AI_UKESM1_0_LL_SSP370 <- resample(AI_UKESM1_0_LL_SSP370,soil.biodiversity)


AI_SSP370 <- (AI_GFDL_ESM4_SSP370+AI_IPSL_CM6A_LR_SSP370+AI_MPI_ESM1_2_HR_SSP370+
                AI_MRI_ESM2_0_SSP370+AI_UKESM1_0_LL_SSP370)/5
writeRaster(AI_SSP370,"E:/Data/Raster/CC-raster/AI_SSP370_2021-2030-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


####2041-2050####
###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP126 <- raster("MAT/GFDL_ESM4_SSP126/2041-2050_All.tif")
MAT_IPSL_CM6A_LR_SSP126 <- raster("MAT/IPSL_CM6A_LR_SSP126/2041-2050_All.tif")
MAT_MPI_ESM1_2_HR_SSP126 <- raster("MAT/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif")
MAT_MRI_ESM2_0_SSP126 <- raster("MAT/MRI_ESM2_0_SSP126/2041-2050_All.tif")
MAT_UKESM1_0_LL_SSP126 <- raster("MAT/UKESM1_0_LL_SSP126/2041-2050_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP126 <- resample(MAT_GFDL_ESM4_SSP126,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP126 <- resample(MAT_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP126 <- resample(MAT_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAT_MRI_ESM2_0_SSP126 <- resample(MAT_MRI_ESM2_0_SSP126,soil.biodiversity)
MAT_UKESM1_0_LL_SSP126 <- resample(MAT_UKESM1_0_LL_SSP126,soil.biodiversity)


MAT_SSP126 <- (MAT_GFDL_ESM4_SSP126+MAT_IPSL_CM6A_LR_SSP126+MAT_MPI_ESM1_2_HR_SSP126+
                 MAT_MRI_ESM2_0_SSP126+MAT_UKESM1_0_LL_SSP126)/5
writeRaster(MAT_SSP126,"E:/Data/Raster/CC-raster/MAT_SSP126-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP126 <- raster("MAP/GFDL_ESM4_SSP126/2041-2050_All.tif")
MAP_IPSL_CM6A_LR_SSP126 <- raster("MAP/IPSL_CM6A_LR_SSP126/2041-2050_All.tif")
MAP_MPI_ESM1_2_HR_SSP126 <- raster("MAP/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif")
MAP_MRI_ESM2_0_SSP126 <- raster("MAP/MRI_ESM2_0_SSP126/2041-2050_All.tif")
MAP_UKESM1_0_LL_SSP126 <- raster("MAP/UKESM1_0_LL_SSP126/2041-2050_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP126 <- resample(MAP_GFDL_ESM4_SSP126,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP126 <- resample(MAP_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP126 <- resample(MAP_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAP_MRI_ESM2_0_SSP126 <- resample(MAP_MRI_ESM2_0_SSP126,soil.biodiversity)
MAP_UKESM1_0_LL_SSP126 <- resample(MAP_UKESM1_0_LL_SSP126,soil.biodiversity)


MAP_SSP126 <- (MAP_GFDL_ESM4_SSP126+MAP_IPSL_CM6A_LR_SSP126+MAP_MPI_ESM1_2_HR_SSP126+
                 MAP_MRI_ESM2_0_SSP126+MAP_UKESM1_0_LL_SSP126)/5
writeRaster(MAP_SSP126,"E:/Data/Raster/CC-raster/MAP_SSP126-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP126 <- raster("AI/GFDL_ESM4_SSP126/2041-2050_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- raster("AI/IPSL_CM6A_LR_SSP126/2041-2050_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- raster("AI/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif")
AI_MRI_ESM2_0_SSP126 <- raster("AI/MRI_ESM2_0_SSP126/2041-2050_All.tif")
AI_UKESM1_0_LL_SSP126 <- raster("AI/UKESM1_0_LL_SSP126/2041-2050_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP126 <- resample(AI_GFDL_ESM4_SSP126,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP126 <- resample(AI_IPSL_CM6A_LR_SSP126,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP126 <- resample(AI_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
AI_MRI_ESM2_0_SSP126 <- resample(AI_MRI_ESM2_0_SSP126,soil.biodiversity)
AI_UKESM1_0_LL_SSP126 <- resample(AI_UKESM1_0_LL_SSP126,soil.biodiversity)


AI_SSP126 <- (AI_GFDL_ESM4_SSP126+AI_IPSL_CM6A_LR_SSP126+AI_MPI_ESM1_2_HR_SSP126+
                 AI_MRI_ESM2_0_SSP126+AI_UKESM1_0_LL_SSP126)/5
writeRaster(AI_SSP126,"E:/Data/Raster/CC-raster/AI_SSP126-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP370 <- raster("MAT/GFDL_ESM4_SSP370/2041-2050_All.tif")
MAT_IPSL_CM6A_LR_SSP370 <- raster("MAT/IPSL_CM6A_LR_SSP370/2041-2050_All.tif")
MAT_MPI_ESM1_2_HR_SSP370 <- raster("MAT/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif")
MAT_MRI_ESM2_0_SSP370 <- raster("MAT/MRI_ESM2_0_SSP370/2041-2050_All.tif")
MAT_UKESM1_0_LL_SSP370 <- raster("MAT/UKESM1_0_LL_SSP370/2041-2050_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP370 <- resample(MAT_GFDL_ESM4_SSP370,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP370 <- resample(MAT_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP370 <- resample(MAT_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAT_MRI_ESM2_0_SSP370 <- resample(MAT_MRI_ESM2_0_SSP370,soil.biodiversity)
MAT_UKESM1_0_LL_SSP370 <- resample(MAT_UKESM1_0_LL_SSP370,soil.biodiversity)


MAT_SSP370 <- (MAT_GFDL_ESM4_SSP370+MAT_IPSL_CM6A_LR_SSP370+MAT_MPI_ESM1_2_HR_SSP370+
                 MAT_MRI_ESM2_0_SSP370+MAT_UKESM1_0_LL_SSP370)/5
writeRaster(MAT_SSP370,"E:/Data/Raster/CC-raster/MAT_SSP370-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP370 <- raster("MAP/GFDL_ESM4_SSP370/2041-2050_All.tif")
MAP_IPSL_CM6A_LR_SSP370 <- raster("MAP/IPSL_CM6A_LR_SSP370/2041-2050_All.tif")
MAP_MPI_ESM1_2_HR_SSP370 <- raster("MAP/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif")
MAP_MRI_ESM2_0_SSP370 <- raster("MAP/MRI_ESM2_0_SSP370/2041-2050_All.tif")
MAP_UKESM1_0_LL_SSP370 <- raster("MAP/UKESM1_0_LL_SSP370/2041-2050_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP370 <- resample(MAP_GFDL_ESM4_SSP370,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP370 <- resample(MAP_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP370 <- resample(MAP_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAP_MRI_ESM2_0_SSP370 <- resample(MAP_MRI_ESM2_0_SSP370,soil.biodiversity)
MAP_UKESM1_0_LL_SSP370 <- resample(MAP_UKESM1_0_LL_SSP370,soil.biodiversity)


MAP_SSP370 <- (MAP_GFDL_ESM4_SSP370+MAP_IPSL_CM6A_LR_SSP370+MAP_MPI_ESM1_2_HR_SSP370+
                 MAP_MRI_ESM2_0_SSP370+MAP_UKESM1_0_LL_SSP370)/5
writeRaster(MAP_SSP370,"E:/Data/Raster/CC-raster/MAP_SSP370-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP370 <- raster("AI/GFDL_ESM4_SSP370/2041-2050_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- raster("AI/IPSL_CM6A_LR_SSP370/2041-2050_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- raster("AI/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif")
AI_MRI_ESM2_0_SSP370 <- raster("AI/MRI_ESM2_0_SSP370/2041-2050_All.tif")
AI_UKESM1_0_LL_SSP370 <- raster("AI/UKESM1_0_LL_SSP370/2041-2050_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP370 <- resample(AI_GFDL_ESM4_SSP370,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP370 <- resample(AI_IPSL_CM6A_LR_SSP370,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP370 <- resample(AI_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
AI_MRI_ESM2_0_SSP370 <- resample(AI_MRI_ESM2_0_SSP370,soil.biodiversity)
AI_UKESM1_0_LL_SSP370 <- resample(AI_UKESM1_0_LL_SSP370,soil.biodiversity)


AI_SSP370 <- (AI_GFDL_ESM4_SSP370+AI_IPSL_CM6A_LR_SSP370+AI_MPI_ESM1_2_HR_SSP370+
                AI_MRI_ESM2_0_SSP370+AI_UKESM1_0_LL_SSP370)/5
writeRaster(AI_SSP370,"E:/Data/Raster/CC-raster/AI_SSP370-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


####2061-2070####
###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP126 <- raster("MAT/GFDL_ESM4_SSP126/2061-2070_All.tif")
MAT_IPSL_CM6A_LR_SSP126 <- raster("MAT/IPSL_CM6A_LR_SSP126/2061-2070_All.tif")
MAT_MPI_ESM1_2_HR_SSP126 <- raster("MAT/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif")
MAT_MRI_ESM2_0_SSP126 <- raster("MAT/MRI_ESM2_0_SSP126/2061-2070_All.tif")
MAT_UKESM1_0_LL_SSP126 <- raster("MAT/UKESM1_0_LL_SSP126/2061-2070_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP126 <- resample(MAT_GFDL_ESM4_SSP126,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP126 <- resample(MAT_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP126 <- resample(MAT_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAT_MRI_ESM2_0_SSP126 <- resample(MAT_MRI_ESM2_0_SSP126,soil.biodiversity)
MAT_UKESM1_0_LL_SSP126 <- resample(MAT_UKESM1_0_LL_SSP126,soil.biodiversity)


MAT_SSP126 <- (MAT_GFDL_ESM4_SSP126+MAT_IPSL_CM6A_LR_SSP126+MAT_MPI_ESM1_2_HR_SSP126+
                 MAT_MRI_ESM2_0_SSP126+MAT_UKESM1_0_LL_SSP126)/5
writeRaster(MAT_SSP126,"E:/Data/Raster/CC-raster/MAT_SSP126_2061-2070-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP126 <- raster("MAP/GFDL_ESM4_SSP126/2061-2070_All.tif")
MAP_IPSL_CM6A_LR_SSP126 <- raster("MAP/IPSL_CM6A_LR_SSP126/2061-2070_All.tif")
MAP_MPI_ESM1_2_HR_SSP126 <- raster("MAP/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif")
MAP_MRI_ESM2_0_SSP126 <- raster("MAP/MRI_ESM2_0_SSP126/2061-2070_All.tif")
MAP_UKESM1_0_LL_SSP126 <- raster("MAP/UKESM1_0_LL_SSP126/2061-2070_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP126 <- resample(MAP_GFDL_ESM4_SSP126,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP126 <- resample(MAP_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP126 <- resample(MAP_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAP_MRI_ESM2_0_SSP126 <- resample(MAP_MRI_ESM2_0_SSP126,soil.biodiversity)
MAP_UKESM1_0_LL_SSP126 <- resample(MAP_UKESM1_0_LL_SSP126,soil.biodiversity)


MAP_SSP126 <- (MAP_GFDL_ESM4_SSP126+MAP_IPSL_CM6A_LR_SSP126+MAP_MPI_ESM1_2_HR_SSP126+
                 MAP_MRI_ESM2_0_SSP126+MAP_UKESM1_0_LL_SSP126)/5
writeRaster(MAP_SSP126,"E:/Data/Raster/CC-raster/MAP_SSP126_2061-2070-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP126 <- raster("AI/GFDL_ESM4_SSP126/2061-2070_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- raster("AI/IPSL_CM6A_LR_SSP126/2061-2070_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- raster("AI/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif")
AI_MRI_ESM2_0_SSP126 <- raster("AI/MRI_ESM2_0_SSP126/2061-2070_All.tif")
AI_UKESM1_0_LL_SSP126 <- raster("AI/UKESM1_0_LL_SSP126/2061-2070_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP126 <- resample(AI_GFDL_ESM4_SSP126,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP126 <- resample(AI_IPSL_CM6A_LR_SSP126,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP126 <- resample(AI_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
AI_MRI_ESM2_0_SSP126 <- resample(AI_MRI_ESM2_0_SSP126,soil.biodiversity)
AI_UKESM1_0_LL_SSP126 <- resample(AI_UKESM1_0_LL_SSP126,soil.biodiversity)


AI_SSP126 <- (AI_GFDL_ESM4_SSP126+AI_IPSL_CM6A_LR_SSP126+AI_MPI_ESM1_2_HR_SSP126+
                AI_MRI_ESM2_0_SSP126+AI_UKESM1_0_LL_SSP126)/5
writeRaster(AI_SSP126,"E:/Data/Raster/CC-raster/AI_SSP126_2061-2070-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP370 <- raster("MAT/GFDL_ESM4_SSP370/2061-2070_All.tif")
MAT_IPSL_CM6A_LR_SSP370 <- raster("MAT/IPSL_CM6A_LR_SSP370/2061-2070_All.tif")
MAT_MPI_ESM1_2_HR_SSP370 <- raster("MAT/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif")
MAT_MRI_ESM2_0_SSP370 <- raster("MAT/MRI_ESM2_0_SSP370/2061-2070_All.tif")
MAT_UKESM1_0_LL_SSP370 <- raster("MAT/UKESM1_0_LL_SSP370/2061-2070_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP370 <- resample(MAT_GFDL_ESM4_SSP370,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP370 <- resample(MAT_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP370 <- resample(MAT_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAT_MRI_ESM2_0_SSP370 <- resample(MAT_MRI_ESM2_0_SSP370,soil.biodiversity)
MAT_UKESM1_0_LL_SSP370 <- resample(MAT_UKESM1_0_LL_SSP370,soil.biodiversity)


MAT_SSP370 <- (MAT_GFDL_ESM4_SSP370+MAT_IPSL_CM6A_LR_SSP370+MAT_MPI_ESM1_2_HR_SSP370+
                 MAT_MRI_ESM2_0_SSP370+MAT_UKESM1_0_LL_SSP370)/5
writeRaster(MAT_SSP370,"E:/Data/Raster/CC-raster/MAT_SSP370_2061-2070-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP370 <- raster("MAP/GFDL_ESM4_SSP370/2061-2070_All.tif")
MAP_IPSL_CM6A_LR_SSP370 <- raster("MAP/IPSL_CM6A_LR_SSP370/2061-2070_All.tif")
MAP_MPI_ESM1_2_HR_SSP370 <- raster("MAP/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif")
MAP_MRI_ESM2_0_SSP370 <- raster("MAP/MRI_ESM2_0_SSP370/2061-2070_All.tif")
MAP_UKESM1_0_LL_SSP370 <- raster("MAP/UKESM1_0_LL_SSP370/2061-2070_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP370 <- resample(MAP_GFDL_ESM4_SSP370,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP370 <- resample(MAP_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP370 <- resample(MAP_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAP_MRI_ESM2_0_SSP370 <- resample(MAP_MRI_ESM2_0_SSP370,soil.biodiversity)
MAP_UKESM1_0_LL_SSP370 <- resample(MAP_UKESM1_0_LL_SSP370,soil.biodiversity)


MAP_SSP370 <- (MAP_GFDL_ESM4_SSP370+MAP_IPSL_CM6A_LR_SSP370+MAP_MPI_ESM1_2_HR_SSP370+
                 MAP_MRI_ESM2_0_SSP370+MAP_UKESM1_0_LL_SSP370)/5
writeRaster(MAP_SSP370,"E:/Data/Raster/CC-raster/MAP_SSP370_2061-2070-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP370 <- raster("AI/GFDL_ESM4_SSP370/2061-2070_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- raster("AI/IPSL_CM6A_LR_SSP370/2061-2070_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- raster("AI/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif")
AI_MRI_ESM2_0_SSP370 <- raster("AI/MRI_ESM2_0_SSP370/2061-2070_All.tif")
AI_UKESM1_0_LL_SSP370 <- raster("AI/UKESM1_0_LL_SSP370/2061-2070_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP370 <- resample(AI_GFDL_ESM4_SSP370,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP370 <- resample(AI_IPSL_CM6A_LR_SSP370,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP370 <- resample(AI_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
AI_MRI_ESM2_0_SSP370 <- resample(AI_MRI_ESM2_0_SSP370,soil.biodiversity)
AI_UKESM1_0_LL_SSP370 <- resample(AI_UKESM1_0_LL_SSP370,soil.biodiversity)


AI_SSP370 <- (AI_GFDL_ESM4_SSP370+AI_IPSL_CM6A_LR_SSP370+AI_MPI_ESM1_2_HR_SSP370+
                AI_MRI_ESM2_0_SSP370+AI_UKESM1_0_LL_SSP370)/5
writeRaster(AI_SSP370,"E:/Data/Raster/CC-raster/AI_SSP370_2061-2070-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


####2091-2100####
###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP126 <- raster("MAT/GFDL_ESM4_SSP126/2091-2100_All.tif")
MAT_IPSL_CM6A_LR_SSP126 <- raster("MAT/IPSL_CM6A_LR_SSP126/2091-2100_All.tif")
MAT_MPI_ESM1_2_HR_SSP126 <- raster("MAT/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif")
MAT_MRI_ESM2_0_SSP126 <- raster("MAT/MRI_ESM2_0_SSP126/2091-2100_All.tif")
MAT_UKESM1_0_LL_SSP126 <- raster("MAT/UKESM1_0_LL_SSP126/2091-2100_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP126 <- resample(MAT_GFDL_ESM4_SSP126,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP126 <- resample(MAT_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP126 <- resample(MAT_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAT_MRI_ESM2_0_SSP126 <- resample(MAT_MRI_ESM2_0_SSP126,soil.biodiversity)
MAT_UKESM1_0_LL_SSP126 <- resample(MAT_UKESM1_0_LL_SSP126,soil.biodiversity)


MAT_SSP126 <- (MAT_GFDL_ESM4_SSP126+MAT_IPSL_CM6A_LR_SSP126+MAT_MPI_ESM1_2_HR_SSP126+
                 MAT_MRI_ESM2_0_SSP126+MAT_UKESM1_0_LL_SSP126)/5
writeRaster(MAT_SSP126,"E:/Data/Raster/CC-raster/MAT_SSP126_2091-2100-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP126 <- raster("MAP/GFDL_ESM4_SSP126/2091-2100_All.tif")
MAP_IPSL_CM6A_LR_SSP126 <- raster("MAP/IPSL_CM6A_LR_SSP126/2091-2100_All.tif")
MAP_MPI_ESM1_2_HR_SSP126 <- raster("MAP/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif")
MAP_MRI_ESM2_0_SSP126 <- raster("MAP/MRI_ESM2_0_SSP126/2091-2100_All.tif")
MAP_UKESM1_0_LL_SSP126 <- raster("MAP/UKESM1_0_LL_SSP126/2091-2100_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP126 <- resample(MAP_GFDL_ESM4_SSP126,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP126 <- resample(MAP_IPSL_CM6A_LR_SSP126,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP126 <- resample(MAP_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
MAP_MRI_ESM2_0_SSP126 <- resample(MAP_MRI_ESM2_0_SSP126,soil.biodiversity)
MAP_UKESM1_0_LL_SSP126 <- resample(MAP_UKESM1_0_LL_SSP126,soil.biodiversity)


MAP_SSP126 <- (MAP_GFDL_ESM4_SSP126+MAP_IPSL_CM6A_LR_SSP126+MAP_MPI_ESM1_2_HR_SSP126+
                 MAP_MRI_ESM2_0_SSP126+MAP_UKESM1_0_LL_SSP126)/5
writeRaster(MAP_SSP126,"E:/Data/Raster/CC-raster/MAP_SSP126_2091-2100-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP126 <- raster("AI/GFDL_ESM4_SSP126/2091-2100_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- raster("AI/IPSL_CM6A_LR_SSP126/2091-2100_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- raster("AI/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif")
AI_MRI_ESM2_0_SSP126 <- raster("AI/MRI_ESM2_0_SSP126/2091-2100_All.tif")
AI_UKESM1_0_LL_SSP126 <- raster("AI/UKESM1_0_LL_SSP126/2091-2100_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP126 <- resample(AI_GFDL_ESM4_SSP126,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP126 <- resample(AI_IPSL_CM6A_LR_SSP126,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP126 <- resample(AI_MPI_ESM1_2_HR_SSP126,soil.biodiversity)
AI_MRI_ESM2_0_SSP126 <- resample(AI_MRI_ESM2_0_SSP126,soil.biodiversity)
AI_UKESM1_0_LL_SSP126 <- resample(AI_UKESM1_0_LL_SSP126,soil.biodiversity)


AI_SSP126 <- (AI_GFDL_ESM4_SSP126+AI_IPSL_CM6A_LR_SSP126+AI_MPI_ESM1_2_HR_SSP126+
                AI_MRI_ESM2_0_SSP126+AI_UKESM1_0_LL_SSP126)/5
writeRaster(AI_SSP126,"E:/Data/Raster/CC-raster/AI_SSP126_2091-2100-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


###MAT###
setwd("E:/Data/Raster/CMIP6/ISIMIP")
MAT_GFDL_ESM4_SSP370 <- raster("MAT/GFDL_ESM4_SSP370/2091-2100_All.tif")
MAT_IPSL_CM6A_LR_SSP370 <- raster("MAT/IPSL_CM6A_LR_SSP370/2091-2100_All.tif")
MAT_MPI_ESM1_2_HR_SSP370 <- raster("MAT/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif")
MAT_MRI_ESM2_0_SSP370 <- raster("MAT/MRI_ESM2_0_SSP370/2091-2100_All.tif")
MAT_UKESM1_0_LL_SSP370 <- raster("MAT/UKESM1_0_LL_SSP370/2091-2100_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAT_GFDL_ESM4_SSP370 <- resample(MAT_GFDL_ESM4_SSP370,soil.biodiversity)
MAT_IPSL_CM6A_LR_SSP370 <- resample(MAT_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAT_MPI_ESM1_2_HR_SSP370 <- resample(MAT_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAT_MRI_ESM2_0_SSP370 <- resample(MAT_MRI_ESM2_0_SSP370,soil.biodiversity)
MAT_UKESM1_0_LL_SSP370 <- resample(MAT_UKESM1_0_LL_SSP370,soil.biodiversity)


MAT_SSP370 <- (MAT_GFDL_ESM4_SSP370+MAT_IPSL_CM6A_LR_SSP370+MAT_MPI_ESM1_2_HR_SSP370+
                 MAT_MRI_ESM2_0_SSP370+MAT_UKESM1_0_LL_SSP370)/5
writeRaster(MAT_SSP370,"E:/Data/Raster/CC-raster/MAT_SSP370_2091-2100-0.1-ok.tif",format="GTiff",overwrite=TRUE)

###MAP###
MAP_GFDL_ESM4_SSP370 <- raster("MAP/GFDL_ESM4_SSP370/2091-2100_All.tif")
MAP_IPSL_CM6A_LR_SSP370 <- raster("MAP/IPSL_CM6A_LR_SSP370/2091-2100_All.tif")
MAP_MPI_ESM1_2_HR_SSP370 <- raster("MAP/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif")
MAP_MRI_ESM2_0_SSP370 <- raster("MAP/MRI_ESM2_0_SSP370/2091-2100_All.tif")
MAP_UKESM1_0_LL_SSP370 <- raster("MAP/UKESM1_0_LL_SSP370/2091-2100_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

MAP_GFDL_ESM4_SSP370 <- resample(MAP_GFDL_ESM4_SSP370,soil.biodiversity)
MAP_IPSL_CM6A_LR_SSP370 <- resample(MAP_IPSL_CM6A_LR_SSP370,soil.biodiversity)
MAP_MPI_ESM1_2_HR_SSP370 <- resample(MAP_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
MAP_MRI_ESM2_0_SSP370 <- resample(MAP_MRI_ESM2_0_SSP370,soil.biodiversity)
MAP_UKESM1_0_LL_SSP370 <- resample(MAP_UKESM1_0_LL_SSP370,soil.biodiversity)


MAP_SSP370 <- (MAP_GFDL_ESM4_SSP370+MAP_IPSL_CM6A_LR_SSP370+MAP_MPI_ESM1_2_HR_SSP370+
                 MAP_MRI_ESM2_0_SSP370+MAP_UKESM1_0_LL_SSP370)/5
writeRaster(MAP_SSP370,"E:/Data/Raster/CC-raster/MAP_SSP370_2091-2100-0.1-ok.tif",forMAP="GTiff",overwrite=TRUE)


###AI###
AI_GFDL_ESM4_SSP370 <- raster("AI/GFDL_ESM4_SSP370/2091-2100_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- raster("AI/IPSL_CM6A_LR_SSP370/2091-2100_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- raster("AI/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif")
AI_MRI_ESM2_0_SSP370 <- raster("AI/MRI_ESM2_0_SSP370/2091-2100_All.tif")
AI_UKESM1_0_LL_SSP370 <- raster("AI/UKESM1_0_LL_SSP370/2091-2100_All.tif")

soil.biodiversity <- raster('E:/Data/Raster/CC-raster/soil_bio_new.tif')

AI_GFDL_ESM4_SSP370 <- resample(AI_GFDL_ESM4_SSP370,soil.biodiversity)
AI_IPSL_CM6A_LR_SSP370 <- resample(AI_IPSL_CM6A_LR_SSP370,soil.biodiversity)
AI_MPI_ESM1_2_HR_SSP370 <- resample(AI_MPI_ESM1_2_HR_SSP370,soil.biodiversity)
AI_MRI_ESM2_0_SSP370 <- resample(AI_MRI_ESM2_0_SSP370,soil.biodiversity)
AI_UKESM1_0_LL_SSP370 <- resample(AI_UKESM1_0_LL_SSP370,soil.biodiversity)


AI_SSP370 <- (AI_GFDL_ESM4_SSP370+AI_IPSL_CM6A_LR_SSP370+AI_MPI_ESM1_2_HR_SSP370+
                AI_MRI_ESM2_0_SSP370+AI_UKESM1_0_LL_SSP370)/5
writeRaster(AI_SSP370,"E:/Data/Raster/CC-raster/AI_SSP370_2091-2100-0.1-ok.tif",forAI="GTiff",overwrite=TRUE)


#### CMIP6 ####
setwd("E:/Data/Raster/CMIP6/ISIMIP")

#### MAT_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAT_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_tas_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### MAP_SSP126
MAP_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_pr_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP126/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAP_SSP370
MAP_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_pr_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_pr_global_daily_2041_2050.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP370/2041-2050.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### PET_SSP126 and AI_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
                        PET_i_10y = sum(PET_i)/10
                        PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP126 <- rasterFromXYZ(PET_GFDL_ESM4_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP126,"./PET/GFDL_ESM4_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP126 <- raster("./MAP/GFDL_ESM4_SSP126/2041-2050_All.tif")
AI_GFDL_ESM4_SSP126 <- MAP_GFDL_ESM4_SSP126/PET_GFDL_ESM4_SSP126
writeRaster(AI_GFDL_ESM4_SSP126,"./AI/GFDL_ESM4_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP126 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP126,"./PET/IPSL_CM6A_LR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- raster("./MAP/IPSL_CM6A_LR_SSP126/2041-2050_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- MAP_IPSL_CM6A_LR_SSP126/PET_IPSL_CM6A_LR_SSP126
writeRaster(AI_IPSL_CM6A_LR_SSP126,"./AI/IPSL_CM6A_LR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP126 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP126,"./PET/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- raster("./MAP/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- MAP_MPI_ESM1_2_HR_SSP126/PET_MPI_ESM1_2_HR_SSP126
writeRaster(AI_MPI_ESM1_2_HR_SSP126,"./AI/MPI_ESM1_2_HR_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP126 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP126,"./PET/MRI_ESM2_0_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- raster("./MAP/MRI_ESM2_0_SSP126/2041-2050_All.tif")
AI_MRI_ESM2_0_SSP126 <- MAP_MRI_ESM2_0_SSP126/PET_MRI_ESM2_0_SSP126
writeRaster(AI_MRI_ESM2_0_SSP126,"./AI/MRI_ESM2_0_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP126 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP126,"./PET/UKESM1_0_LL_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- raster("./MAP/UKESM1_0_LL_SSP126/2041-2050_All.tif")
AI_UKESM1_0_LL_SSP126 <- MAP_UKESM1_0_LL_SSP126/PET_UKESM1_0_LL_SSP126
writeRaster(AI_UKESM1_0_LL_SSP126,"./AI/UKESM1_0_LL_SSP126/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### PET_SSP370 and AI_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP370 <- rasterFromXYZ(PET_GFDL_ESM4_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP370,"./PET/GFDL_ESM4_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP370 <- raster("./MAP/GFDL_ESM4_SSP370/2041-2050_All.tif")
AI_GFDL_ESM4_SSP370 <- MAP_GFDL_ESM4_SSP370/PET_GFDL_ESM4_SSP370
writeRaster(AI_GFDL_ESM4_SSP370,"./AI/GFDL_ESM4_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP370 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP370,"./PET/IPSL_CM6A_LR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- raster("./MAP/IPSL_CM6A_LR_SSP370/2041-2050_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- MAP_IPSL_CM6A_LR_SSP370/PET_IPSL_CM6A_LR_SSP370
writeRaster(AI_IPSL_CM6A_LR_SSP370,"./AI/IPSL_CM6A_LR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP370 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP370,"./PET/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- raster("./MAP/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- MAP_MPI_ESM1_2_HR_SSP370/PET_MPI_ESM1_2_HR_SSP370
writeRaster(AI_MPI_ESM1_2_HR_SSP370,"./AI/MPI_ESM1_2_HR_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP370 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP370,"./PET/MRI_ESM2_0_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- raster("./MAP/MRI_ESM2_0_SSP370/2041-2050_All.tif")
AI_MRI_ESM2_0_SSP370 <- MAP_MRI_ESM2_0_SSP370/PET_MRI_ESM2_0_SSP370
writeRaster(AI_MRI_ESM2_0_SSP370,"./AI/MRI_ESM2_0_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2041_2050.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2041-2050_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP370 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP370,"./PET/UKESM1_0_LL_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- raster("./MAP/UKESM1_0_LL_SSP370/2041-2050_All.tif")
AI_UKESM1_0_LL_SSP370 <- MAP_UKESM1_0_LL_SSP370/PET_UKESM1_0_LL_SSP370
writeRaster(AI_UKESM1_0_LL_SSP370,"./AI/UKESM1_0_LL_SSP370/2041-2050_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)



### 2021-2030 ###
#### MAT_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAT_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_tas_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### MAP_SSP126
MAP_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_pr_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP126/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAP_SSP370
MAP_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_pr_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_pr_global_daily_2021_2030.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP370/2021-2030.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### PET_SSP126 and AI_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP126 <- rasterFromXYZ(PET_GFDL_ESM4_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP126,"./PET/GFDL_ESM4_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP126 <- raster("./MAP/GFDL_ESM4_SSP126/2021-2030_All.tif")
AI_GFDL_ESM4_SSP126 <- MAP_GFDL_ESM4_SSP126/PET_GFDL_ESM4_SSP126
writeRaster(AI_GFDL_ESM4_SSP126,"./AI/GFDL_ESM4_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP126 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP126,"./PET/IPSL_CM6A_LR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- raster("./MAP/IPSL_CM6A_LR_SSP126/2021-2030_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- MAP_IPSL_CM6A_LR_SSP126/PET_IPSL_CM6A_LR_SSP126
writeRaster(AI_IPSL_CM6A_LR_SSP126,"./AI/IPSL_CM6A_LR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP126 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP126,"./PET/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- raster("./MAP/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- MAP_MPI_ESM1_2_HR_SSP126/PET_MPI_ESM1_2_HR_SSP126
writeRaster(AI_MPI_ESM1_2_HR_SSP126,"./AI/MPI_ESM1_2_HR_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP126 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP126,"./PET/MRI_ESM2_0_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- raster("./MAP/MRI_ESM2_0_SSP126/2021-2030_All.tif")
AI_MRI_ESM2_0_SSP126 <- MAP_MRI_ESM2_0_SSP126/PET_MRI_ESM2_0_SSP126
writeRaster(AI_MRI_ESM2_0_SSP126,"./AI/MRI_ESM2_0_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP126 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP126,"./PET/UKESM1_0_LL_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- raster("./MAP/UKESM1_0_LL_SSP126/2021-2030_All.tif")
AI_UKESM1_0_LL_SSP126 <- MAP_UKESM1_0_LL_SSP126/PET_UKESM1_0_LL_SSP126
writeRaster(AI_UKESM1_0_LL_SSP126,"./AI/UKESM1_0_LL_SSP126/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### PET_SSP370 and AI_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP370 <- rasterFromXYZ(PET_GFDL_ESM4_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP370,"./PET/GFDL_ESM4_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP370 <- raster("./MAP/GFDL_ESM4_SSP370/2021-2030_All.tif")
AI_GFDL_ESM4_SSP370 <- MAP_GFDL_ESM4_SSP370/PET_GFDL_ESM4_SSP370
writeRaster(AI_GFDL_ESM4_SSP370,"./AI/GFDL_ESM4_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP370 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP370,"./PET/IPSL_CM6A_LR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- raster("./MAP/IPSL_CM6A_LR_SSP370/2021-2030_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- MAP_IPSL_CM6A_LR_SSP370/PET_IPSL_CM6A_LR_SSP370
writeRaster(AI_IPSL_CM6A_LR_SSP370,"./AI/IPSL_CM6A_LR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP370 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP370,"./PET/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- raster("./MAP/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- MAP_MPI_ESM1_2_HR_SSP370/PET_MPI_ESM1_2_HR_SSP370
writeRaster(AI_MPI_ESM1_2_HR_SSP370,"./AI/MPI_ESM1_2_HR_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP370 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP370,"./PET/MRI_ESM2_0_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- raster("./MAP/MRI_ESM2_0_SSP370/2021-2030_All.tif")
AI_MRI_ESM2_0_SSP370 <- MAP_MRI_ESM2_0_SSP370/PET_MRI_ESM2_0_SSP370
writeRaster(AI_MRI_ESM2_0_SSP370,"./AI/MRI_ESM2_0_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2021_2030.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2021-2030_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP370 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP370,"./PET/UKESM1_0_LL_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- raster("./MAP/UKESM1_0_LL_SSP370/2021-2030_All.tif")
AI_UKESM1_0_LL_SSP370 <- MAP_UKESM1_0_LL_SSP370/PET_UKESM1_0_LL_SSP370
writeRaster(AI_UKESM1_0_LL_SSP370,"./AI/UKESM1_0_LL_SSP370/2021-2030_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


### 2061-2070 ###
#### MAT_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAT_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_tas_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### MAP_SSP126
MAP_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_pr_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP126/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAP_SSP370
MAP_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_pr_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:10,c(365,365,365,366,365,365,365,366,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_pr_global_daily_2061_2070.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP370/2061-2070.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### PET_SSP126 and AI_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP126 <- rasterFromXYZ(PET_GFDL_ESM4_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP126,"./PET/GFDL_ESM4_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP126 <- raster("./MAP/GFDL_ESM4_SSP126/2061-2070_All.tif")
AI_GFDL_ESM4_SSP126 <- MAP_GFDL_ESM4_SSP126/PET_GFDL_ESM4_SSP126
writeRaster(AI_GFDL_ESM4_SSP126,"./AI/GFDL_ESM4_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP126 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP126,"./PET/IPSL_CM6A_LR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- raster("./MAP/IPSL_CM6A_LR_SSP126/2061-2070_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- MAP_IPSL_CM6A_LR_SSP126/PET_IPSL_CM6A_LR_SSP126
writeRaster(AI_IPSL_CM6A_LR_SSP126,"./AI/IPSL_CM6A_LR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP126 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP126,"./PET/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- raster("./MAP/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- MAP_MPI_ESM1_2_HR_SSP126/PET_MPI_ESM1_2_HR_SSP126
writeRaster(AI_MPI_ESM1_2_HR_SSP126,"./AI/MPI_ESM1_2_HR_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP126 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP126,"./PET/MRI_ESM2_0_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- raster("./MAP/MRI_ESM2_0_SSP126/2061-2070_All.tif")
AI_MRI_ESM2_0_SSP126 <- MAP_MRI_ESM2_0_SSP126/PET_MRI_ESM2_0_SSP126
writeRaster(AI_MRI_ESM2_0_SSP126,"./AI/MRI_ESM2_0_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP126 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP126,"./PET/UKESM1_0_LL_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- raster("./MAP/UKESM1_0_LL_SSP126/2061-2070_All.tif")
AI_UKESM1_0_LL_SSP126 <- MAP_UKESM1_0_LL_SSP126/PET_UKESM1_0_LL_SSP126
writeRaster(AI_UKESM1_0_LL_SSP126,"./AI/UKESM1_0_LL_SSP126/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### PET_SSP370 and AI_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP370 <- rasterFromXYZ(PET_GFDL_ESM4_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP370,"./PET/GFDL_ESM4_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP370 <- raster("./MAP/GFDL_ESM4_SSP370/2061-2070_All.tif")
AI_GFDL_ESM4_SSP370 <- MAP_GFDL_ESM4_SSP370/PET_GFDL_ESM4_SSP370
writeRaster(AI_GFDL_ESM4_SSP370,"./AI/GFDL_ESM4_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP370 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP370,"./PET/IPSL_CM6A_LR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- raster("./MAP/IPSL_CM6A_LR_SSP370/2061-2070_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- MAP_IPSL_CM6A_LR_SSP370/PET_IPSL_CM6A_LR_SSP370
writeRaster(AI_IPSL_CM6A_LR_SSP370,"./AI/IPSL_CM6A_LR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP370 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP370,"./PET/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- raster("./MAP/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- MAP_MPI_ESM1_2_HR_SSP370/PET_MPI_ESM1_2_HR_SSP370
writeRaster(AI_MPI_ESM1_2_HR_SSP370,"./AI/MPI_ESM1_2_HR_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP370 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP370,"./PET/MRI_ESM2_0_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- raster("./MAP/MRI_ESM2_0_SSP370/2061-2070_All.tif")
AI_MRI_ESM2_0_SSP370 <- MAP_MRI_ESM2_0_SSP370/PET_MRI_ESM2_0_SSP370
writeRaster(AI_MRI_ESM2_0_SSP370,"./AI/MRI_ESM2_0_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2061_2070.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2061-2070_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP370 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP370,"./PET/UKESM1_0_LL_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- raster("./MAP/UKESM1_0_LL_SSP370/2061-2070_All.tif")
AI_UKESM1_0_LL_SSP370 <- MAP_UKESM1_0_LL_SSP370/PET_UKESM1_0_LL_SSP370
writeRaster(AI_UKESM1_0_LL_SSP370,"./AI/UKESM1_0_LL_SSP370/2061-2070_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)



### 2091-2100 ###
#### MAT_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:10,c(365,366,365,365,365,366,365,365,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAT_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:10,c(365,366,365,365,365,366,365,365,365,365)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/GFDL_ESM4_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/IPSL_CM6A_LR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/MRI_ESM2_0_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAT_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_tas_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAT/UKESM1_0_LL_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### MAP_SSP126
MAP_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_pr_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:10,c(365,366,365,365,365,366,365,365,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp126_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP126,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP126/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### MAP_SSP370
MAP_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_pr_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:10,c(365,366,365,365,365,366,365,365,365,365)))
ymc=monthlyComposite(MAP_GFDL_ESM4_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/GFDL_ESM4_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
year10Indices=sort(rep(1,10))
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/GFDL_ESM4_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- brick("ipsl-cm6a-lr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_IPSL_CM6A_LR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/IPSL_CM6A_LR_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/IPSL_CM6A_LR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- brick("mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_MPI_ESM1_2_HR_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MPI_ESM1_2_HR_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- brick("mri-esm2-0_r1i1p1f1_w5e5_ssp370_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_MRI_ESM2_0_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/MRI_ESM2_0_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/MRI_ESM2_0_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- brick("ukesm1-0-ll_r1i1p1f2_w5e5_ssp370_pr_global_daily_2091_2100.nc")
ymc=monthlyComposite(MAP_UKESM1_0_LL_SSP370,fun=sum,indices=yearIndices,cores=20)
ymc <- ymc*86400
writeRaster(ymc,"./MAP/UKESM1_0_LL_SSP370/2091-2100.nc",format="CDF",bylayer=T,overwrite=TRUE)
y10mc=monthlyComposite(ymc,fun=mean,indices=year10Indices,cores=20)
writeRaster(y10mc,"./MAP/UKESM1_0_LL_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

#### PET_SSP126 and AI_SSP126
MAT_GFDL_ESM4_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP126/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP126 <- rasterFromXYZ(PET_GFDL_ESM4_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP126,"./PET/GFDL_ESM4_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP126 <- raster("./MAP/GFDL_ESM4_SSP126/2091-2100_All.tif")
AI_GFDL_ESM4_SSP126 <- MAP_GFDL_ESM4_SSP126/PET_GFDL_ESM4_SSP126
writeRaster(AI_GFDL_ESM4_SSP126,"./AI/GFDL_ESM4_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP126/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP126 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP126,"./PET/IPSL_CM6A_LR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP126 <- raster("./MAP/IPSL_CM6A_LR_SSP126/2091-2100_All.tif")
AI_IPSL_CM6A_LR_SSP126 <- MAP_IPSL_CM6A_LR_SSP126/PET_IPSL_CM6A_LR_SSP126
writeRaster(AI_IPSL_CM6A_LR_SSP126,"./AI/IPSL_CM6A_LR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP126/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP126 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP126,"./PET/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP126 <- raster("./MAP/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif")
AI_MPI_ESM1_2_HR_SSP126 <- MAP_MPI_ESM1_2_HR_SSP126/PET_MPI_ESM1_2_HR_SSP126
writeRaster(AI_MPI_ESM1_2_HR_SSP126,"./AI/MPI_ESM1_2_HR_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP126/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP126 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP126,"./PET/MRI_ESM2_0_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP126 <- raster("./MAP/MRI_ESM2_0_SSP126/2091-2100_All.tif")
AI_MRI_ESM2_0_SSP126 <- MAP_MRI_ESM2_0_SSP126/PET_MRI_ESM2_0_SSP126
writeRaster(AI_MRI_ESM2_0_SSP126,"./AI/MRI_ESM2_0_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP126 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP126,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP126/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP126.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP126 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP126.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP126,"./PET/UKESM1_0_LL_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP126 <- raster("./MAP/UKESM1_0_LL_SSP126/2091-2100_All.tif")
AI_UKESM1_0_LL_SSP126 <- MAP_UKESM1_0_LL_SSP126/PET_UKESM1_0_LL_SSP126
writeRaster(AI_UKESM1_0_LL_SSP126,"./AI/UKESM1_0_LL_SSP126/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


#### PET_SSP370 and AI_SSP370
MAT_GFDL_ESM4_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_GFDL_ESM4_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/GFDL_ESM4_SSP370/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_GFDL_ESM4_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_GFDL_ESM4_SSP370 <- rasterFromXYZ(PET_GFDL_ESM4_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_GFDL_ESM4_SSP370,"./PET/GFDL_ESM4_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_GFDL_ESM4_SSP370 <- raster("./MAP/GFDL_ESM4_SSP370/2091-2100_All.tif")
AI_GFDL_ESM4_SSP370 <- MAP_GFDL_ESM4_SSP370/PET_GFDL_ESM4_SSP370
writeRaster(AI_GFDL_ESM4_SSP370,"./AI/GFDL_ESM4_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_IPSL_CM6A_LR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_IPSL_CM6A_LR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/IPSL_CM6A_LR_SSP370/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_IPSL_CM6A_LR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_IPSL_CM6A_LR_SSP370 <- rasterFromXYZ(PET_IPSL_CM6A_LR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_IPSL_CM6A_LR_SSP370,"./PET/IPSL_CM6A_LR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_IPSL_CM6A_LR_SSP370 <- raster("./MAP/IPSL_CM6A_LR_SSP370/2091-2100_All.tif")
AI_IPSL_CM6A_LR_SSP370 <- MAP_IPSL_CM6A_LR_SSP370/PET_IPSL_CM6A_LR_SSP370
writeRaster(AI_IPSL_CM6A_LR_SSP370,"./AI/IPSL_CM6A_LR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MPI_ESM1_2_HR_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MPI_ESM1_2_HR_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MPI_ESM1_2_HR_SSP370/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MPI_ESM1_2_HR_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MPI_ESM1_2_HR_SSP370 <- rasterFromXYZ(PET_MPI_ESM1_2_HR_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MPI_ESM1_2_HR_SSP370,"./PET/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MPI_ESM1_2_HR_SSP370 <- raster("./MAP/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif")
AI_MPI_ESM1_2_HR_SSP370 <- MAP_MPI_ESM1_2_HR_SSP370/PET_MPI_ESM1_2_HR_SSP370
writeRaster(AI_MPI_ESM1_2_HR_SSP370,"./AI/MPI_ESM1_2_HR_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_MRI_ESM2_0_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_MRI_ESM2_0_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/MRI_ESM2_0_SSP370/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_MRI_ESM2_0_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_MRI_ESM2_0_SSP370 <- rasterFromXYZ(PET_MRI_ESM2_0_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_MRI_ESM2_0_SSP370,"./PET/MRI_ESM2_0_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_MRI_ESM2_0_SSP370 <- raster("./MAP/MRI_ESM2_0_SSP370/2091-2100_All.tif")
AI_MRI_ESM2_0_SSP370 <- MAP_MRI_ESM2_0_SSP370/PET_MRI_ESM2_0_SSP370
writeRaster(AI_MRI_ESM2_0_SSP370,"./AI/MRI_ESM2_0_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)


MAT_UKESM1_0_LL_SSP370 <- brick("gfdl-esm4_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc")
yearIndices=sort(rep(1:120,c(31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,29,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31,
                             31,28,31,30,31,30,31,31,30,31,30,31)))
ymc=monthlyComposite(MAT_UKESM1_0_LL_SSP370,fun=mean,indices=yearIndices,cores=20)
ymc <- ymc-273.15
writeRaster(ymc,"./MAT/UKESM1_0_LL_SSP370/2091-2100_monthly.nc",format="CDF",overwrite=TRUE)
ymc.df <- as.data.frame(ymc,xy=T)
ymc.df.tav <- ymc.df[,-(1:2)]
ymc.df.lat <- ymc.df[,2]
tav.df <- t(ymc.df.tav)
lat.df <- data.frame(t(ymc.df.lat))

PET_1 <- thornthwaite(tav.df[,1],lat.df[,1])
PET_1_10y <- sum(PET_1)/10

for (i in 2:259200){PET_i = thornthwaite(tav.df[,i],lat.df[,i])
PET_i_10y = sum(PET_i)/10
PET_1_10y = cbind(PET_1_10y,PET_i_10y)}
PET_1_10y_back <- data.frame(t(PET_1_10y))
head(PET_1_10y_back)
ggplot(PET_1_10y_back)+
  geom_density(aes(t.PET_1_10y.))

PET_UKESM1_0_LL_SSP370.df <- cbind.data.frame(ymc.df,PET_1_10y_back$t.PET_1_10y.)
PET_UKESM1_0_LL_SSP370 <- rasterFromXYZ(PET_UKESM1_0_LL_SSP370.df[,c("x", "y", "PET_1_10y_back$t.PET_1_10y.")],crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
writeRaster(PET_UKESM1_0_LL_SSP370,"./PET/UKESM1_0_LL_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)

MAP_UKESM1_0_LL_SSP370 <- raster("./MAP/UKESM1_0_LL_SSP370/2091-2100_All.tif")
AI_UKESM1_0_LL_SSP370 <- MAP_UKESM1_0_LL_SSP370/PET_UKESM1_0_LL_SSP370
writeRaster(AI_UKESM1_0_LL_SSP370,"./AI/UKESM1_0_LL_SSP370/2091-2100_All.tif",format="GTiff",bylayer=T,overwrite=TRUE)
