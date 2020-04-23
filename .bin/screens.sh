#!/bin/bash


if [[ "$1" == "two" ]]; then
    nvidia-settings --assign CurrentMetaMode="DPY-0: nvidia-auto-select @1920x1080 +0+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-2: 1920x1080_120 @1920x1080 +1920+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
elif [[ "$1" == "three" ]]; then
    nvidia-settings --assign CurrentMetaMode="DPY-0: nvidia-auto-select @1920x1080 +0+0 {ViewPortIn=1920x1080,ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On,ForceFullCompositionPipeline=On}, DPY-2: nvidia-auto-select @1920x1080+1920+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0,ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-1:1920x1080 @1920x1080 +3840+0 {ViewPortIn=1920x1080,ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On,ForceFullCompositionPipeline=On}"
fi

nvidia-settings -l
