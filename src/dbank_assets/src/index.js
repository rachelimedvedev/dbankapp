import { format } from "util";
import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async function(){
  //the await make the object to wait for the answer of the promise to the async function checkbalance, moreover we are able to see the result because our function is async too.
  update()
})

document.querySelector("form").addEventListener("submit",async function(event){
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");

  const inputAmount= parseFloat(document.getElementById("input-amount").value);
  const withdrawal= parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled",true);   

  if (document.getElementById("input-amount").value.length>0){
    await dbank.topUp(inputAmount);
  }
  if(document.getElementById("withdrawal-amount").value.length>0){
    await dbank.withdrawl(withdrawal);
  }
  
  await dbank.compound();

  update()

  button.removeAttribute("disabled");



  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";


});

async function update(){
  const currentamount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentamount *100)/100;
};