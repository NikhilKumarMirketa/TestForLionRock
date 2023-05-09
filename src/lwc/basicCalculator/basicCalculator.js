import {LightningElement} from 'lwc';

export default class BasicCalculator extends LightningElement {
    
     result=0;
     resultflag=false;
     fnum=0;snum=0;
     
     onChangeInput1(event){
        this.resultflag=false;
        this.fnum=event.target.value;      
     }
     onChangeInput2(event){
        this.resultflag=false;
        this.snum=event.target.value; 
     }
     onSumClick(){
         this.resultflag=true;
         this.result=Number(this.fnum)+Number(this.snum);
         console.log(Number(this.result));
     }
     onSubClick(){
        this.resultflag=true;
        this.result=Number(this.fnum)-Number(this.snum);
        console.log(Number(this.result));
    
     }
     onMulClick(){
        this.resultflag=true;
        this.result=Number(this.fnum)*Number(this.snum);
        console.log(Number(this.result));
     
     }
}