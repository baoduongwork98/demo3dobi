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
                function hideInfor(){
                  modelViewer2.querySelector("#infor-hybrid").style.display = 'none';
                  modelViewer2.querySelector("#infor-research").style.display = 'none';
                  modelViewer2.querySelector("#infor-qc").style.display = 'none';
                  modelViewer2.querySelector("#infor-mobile").style.display = 'none';
                  modelViewer2.querySelector("#infor-phpweb").style.display = 'none';
                  modelViewer2.querySelector("#infor-admin").style.display = 'none';
                }
                function updateInfor(id) {
                   hideInfor();
                  //  modelViewer2.querySelectorAll(".inforbtn").style.display = 'none';
                switch(id){
                  case "hybrid":
                    var infor = modelViewer2.querySelector("#infor-hybrid"); 
                     infor.style.display = 'block';
                  break;
                  case "research":
                    var infor = modelViewer2.querySelector("#infor-research"); 
                     infor.style.display = 'block';
                  break;
                  case "qc":
                    var infor = modelViewer2.querySelector("#infor-qc"); 
                     infor.style.display = 'block';
                     break;
                    case "mobile":
                      var infor = modelViewer2.querySelector("#infor-mobile");
                      infor.style.display = 'block';
                     break;
                      case "phpweb":
                    var infor = modelViewer2.querySelector("#infor-phpweb");
                      infor.style.display = 'block';
                      break;
                      case "admin":
                    var infor = modelViewer2.querySelector("#infor-admin");
                      infor.style.display = 'block';
                      break;
                  default:
                }
                  
                  
                }
                modelViewer2.querySelectorAll('button').forEach((hotspot) => {
                  hotspot.addEventListener('click', () => {
                    if(hotspot.id =="infor") return;
                    if(hotspot.dataset.target == modelViewer2.getCameraTarget()) {
                      modelViewer2.cameraTarget = '0m 0m 0m';
                      modelViewer2.cameraOrbit = 'auto auto 100%';
                      hideInfor();
                    }
                    else
                    {
                      annotationClicked(hotspot);
                      updateInfor(hotspot.id);
                    }
                  });
                });
              ''';
//data position  = v h z ??
//data targer
  final String html = ''' 
                <button 
                  class="view-button" 
                  slot="hotspot-0" 
                  id="hybrid"
                  data-position="500m 300m -200m " 
                  data-normal="0m 0m 0m" 
                  data-orbit="0deg 0deg 0.5m" 
                  data-target="400m 0m -300m">
                    Hybrid
                </button>    
             
                <button 
                id="research"
                class="view-button" 
                slot="hotspot-1" 
                data-position="500m 400m -400m " 
                data-normal="0m 0m 0m " 
                data-orbit="0.6201305939222931rad 1.0687151942703803rad 1.5m" 
                data-target="396.9452510016575m 4.7610942776486285m -472.3628510224538m">
                    Research
                </button>    
                <button 
                  id="qc"
                  class="view-button" 
                  slot="hotspot-2" 
                  data-position="300m 250m 100m " 
                  data-normal="0m 0m 0m " 
                  data-orbit="90deg 0rad 0m" 
                  data-target="494.3118482703615m 42.32959710564006m 82.24640935170376m">
                    QC
                  </button>   
                <button
                  id="mobile" 
                  class="view-button" 
                  slot="hotspot-3" 
                  data-position="-350m 200m 210m " 
                  data-normal="0m 0m 0m" 
                  data-orbit="180deg 25deg 0m" 
                  data-target="-300m -100m 100m">
                    Mobile
                  </button> 
                  <button
                    id="phpweb"
                    class="view-button" 
                    slot="hotspot-4" 
                    data-position="-623m 300m -300m " 
                    data-normal="0m 0m 0m " 
                    data-orbit="0rad 0rad 1.5m" 
                    data-target="-700m -200m -300m">
                    PHPWeb
                  </button> 
                  <button
                  id="admin"
                  class="view-button" 
                  slot="hotspot-5" 
                  data-position="-600m 300m 300m " 
                  data-normal="0m 0m 0m " 
                  data-orbit="-180deg 0deg 0m" 
                  data-target="-700m -200m 400m">
                    Admin
                  </button> 

                <button id="infor-hybrid"
                  class="inforbtn"   
                  data-position="300m 300m -200m "
                  data-normal="0m 0m 0m"  
                  slot="hotspot">
                  <div>Team Hybrid</div>
                  <div>TeamLead: Quinn</div> 
                  <div>Team Size: 9 Member</div>
                </button>

                <button id="infor-research"
                  class="inforbtn"   
                  data-position="300m 400m -400m " 
                  data-normal="0m 0m 0m"  
                  slot="hotspot-6">
                  <div>Team Research</div>
                  <div>TeamLead: TBD</div> 
                  <div>Team Size: TBD</div>
                </button>

                 <button id="infor-qc"
                  class="inforbtn"   
                  data-position="600m 250m 200m " 
                  data-normal="0m 0m 0m"  
                  slot="hotspot-7">
                  <div>Team QC-QA</div>
                  <div>TeamLead: TBD</div> 
                  <div>Team Size: TBD</div>
                </button>
                <button id="infor-mobile"
                  class="inforbtn"   
                  data-position="-200m 200m 210m " 
                  data-normal="0m 0m 0m"  
                  slot="hotspot-8">
                  <div>Team Mobile</div>
                  <div>TeamLead: TBD</div> 
                  <div>Team Size: TBD</div>
                </button>
                  <button id="infor-phpweb"
                  class="inforbtn"   
                  data-position="-740m 300m -300m " 
                  data-normal="0m 0m 0m"  
                  slot="hotspot-9">
                  <div>Team PHPWEB</div>
                  <div>TeamLead: TBD</div> 
                  <div>Team Size: TBD</div>
                </button>
                
                 <button id="infor-admin"
                  class="inforbtn"   
                  data-position="-700m 300m 300m " 
                  data-normal="0m 0m 0m"  
                  slot="hotspot-10">
                  <div>Team Admin</div>
                  <div>TeamLead: TBD</div> 
                  <div>Team Size: TBD</div>
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
              .inforbtn{
                display: none;  
              }
            ''';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ModelViewer(
          id: 'orbit-demo',
          disableZoom: true,
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
