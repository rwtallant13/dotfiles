#!/bin/bash


if [[ "$1" == "two" || "$1" == "2" ]]; then
    nvidia-settings --assign CurrentMetaMode="DPY-2: 1920x1080_144 @1920x1080 +1920+120 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-0: 1920x1200_75 @1920x1200 +0+0 {ViewPortIn=1920x1200, ViewPortOut=1920x1200+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
elif [[ "$1" == "three" || "$1" == "3" ]]; then
    nvidia-settings --assign CurrentMetaMode="DPY-2: 1920x1080_144 @1920x1080 +1920+120 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-0: 1920x1200_75 @1920x1200 +0+0 {ViewPortIn=1920x1200, ViewPortOut=1920x1200+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On} DPY-1:1920x1080 @1920x1080 +3840+0 {ViewPortIn=1920x1080,ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On,ForceFullCompositionPipeline=On}"
fi

nvidia-settings -l
