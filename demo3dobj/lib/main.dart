import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final String js = '''
                const modelViewer2 = document.querySelector("#orbit-demo");
                const annotationClicked = (annotation) => {
                  let dataset = annotation.dataset;
                  modelViewer2.cameraTarget = dataset.target;
                  modelViewer2.cameraOrbit = dataset.orbit;
                }

                modelViewer2.querySelectorAll('button').forEach((hotspot) => {
                  hotspot.addEventListener('click', () => {
                    
                    if(hotspot.dataset.target == modelViewer2.getCameraTarget()) {
                      var target = localStorage.getItem('target');
                      var orbit = localStorage.getItem('orbit');
                      modelViewer2.cameraTarget = target;
                      modelViewer2.cameraOrbit = orbit;
                    }
                    else
                    {
                      localStorage.setItem('target', modelViewer2.getCameraTarget());
                      localStorage.setItem('orbit', modelViewer2.getCameraOrbit());
                      annotationClicked(hotspot);
                    }
                  });
                });
                 
              ''';
//data position  = v h z ??
//data targer
  final String html = ''' 
                <button class="view-button" 
                slot="hotspot-0" 
                data-position="500m 300m -200m " 
                data-normal="0m 0m 0m" 
                data-orbit="0deg 0deg 0.5m" 
                data-target="400m 0m -300m">
                    Hybrid
                  </button>      
                  <label>Hybrid in here</label>
                  <button class="view-button" 
                slot="hotspot-1" 
                data-position="500m 400m -400m " 
                data-normal="0m 0m 0m " 
                data-orbit="0.6201305939222931rad 1.0687151942703803rad 1.5m" 
                data-target="396.9452510016575m 4.7610942776486285m -472.3628510224538m">
                    Research
                  </button>    
                  <button class="view-button" 
                slot="hotspot-2" 
                data-position="300m 250m 100m " 
                data-normal="0m 0m 0m " 
                data-orbit="1.7095084255814095rad 0.8323983288492213rad 1.5m" 
                data-target="494.3118482703615m 42.32959710564006m 82.24640935170376m">
                    QC
                  </button>   
                  <button class="view-button" 
                slot="hotspot-3" 
                data-position="-265.56m 200m 208.18m " 
                data-normal="0m 0m 0m " 
                data-orbit="0.7182047754428511rad 0.5047886505271754rad 0.01m" 
                data-target="-272.1976328761168m 42.1358924665605m 122.80057373929263m">
                    Mobile
                  </button> 
                  <button class="view-button" 
                slot="hotspot-4" 
                data-position="-622.76m 300m -300m " 
                data-normal="0m 0m 0m " 
                data-orbit="0rad 0rad 1.5m" 
                data-target="-700m -200m -300m">
                    PHP+Web
                  </button> 
                  <button class="view-button" 
                slot="hotspot-5" 
                data-position="-675.65m 300m 300m " 
                data-normal="0m 0m 0m " 
               data-orbit="-180deg 0deg 0m" 
                data-target="-700m -200m 400m">
                    Admin
                  </button> 

                ''';
  final String css = ''' 
              .view-button {
                  background: #fff;
                  border-radius: 4px;
                  border: none;
                  box-sizing: border-box;
                  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.25);
                  color: rgba(0, 0, 0, 0.8);
                  display: block;
                  font-family: Futura, Helvetica Neue, sans-serif;
                  font-size: 12px;
                  font-weight: 700;
                  max-width: 128px;
                  overflow-wrap: break-word;
                  padding: 0.5em 1em;
                  position: absolute;
                  width: max-content;
                  height: max-content;
                  transform: translate3d(-50%, -50%, 0);
                }
            ''';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ModelViewer(
          id: 'orbit-demo',
          src: 'assets/test/companynew.glb',
          minCameraOrbit: 'auto auto 50%',
          // cameraOrbit: '0deg 0deg 50%',
          // cameraTarget: '0m 0m 0m',
          interpolationDecay: 100, // duration animation
          backgroundColor: const Color.fromARGB(255, 41, 55, 61),
          relatedJs: js,
          innerModelViewerHtml: html,
          relatedCss: css,
        )),
      ),
    );
  }
}
