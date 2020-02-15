function useWave(containerName, audioPath, ctrlName) {
            var getHeight = $(containerName).css("height");
            var cutToken = getHeight.indexOf("px");
            var realHeight = getHeight.substring(0,cutToken);

            var	wavesurfer = WaveSurfer.create({
                container: containerName,
                waveColor: '#585858',
                progressColor: '#fff',
                height:realHeight,
                barWidth:1
            });
            wavesurfer.load(audioPath); // 파일명은 select로 mp3_name 받아서 넣기
            $(ctrlName).click(function() {
                wavesurfer.playPause();
            });
            wavesurfer.on('pause', function() {
            	wavesurfer.params.container.style.opacity = 0.7;
            });
            wavesurfer.on('finish', function() {
            	console.log("finished");
            	//wavesurfer.destroy();
            });
        }