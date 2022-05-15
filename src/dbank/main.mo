import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentvalue: Float = 300;
  currentvalue := 300;
  stable var startTime = Time.now();
  Debug.print(debug_show(currentvalue));

//allow user to add amount
  public func topUp(amount : Float){
    currentvalue+=amount;
    Debug.print(debug_show(currentvalue));
  };


//allow user to withdrawl amount
  public func withdrawl(amount : Float){
    let tempvalue : Float = currentvalue - amount;
    if(tempvalue >=0){
      currentvalue-=amount;
      Debug.print(debug_show(currentvalue));
    }
    else{
      Debug.print("no nat number , minus!");
    };};


    public query func checkBalance() : async Float{
      return currentvalue;
    };

    public func compound(){
    //increases compount money in seconds
    let currentTime = Time.now();
    let timeElappsedNS = (currentTime - startTime);
    let timeElappsedS = (timeElappsedNS/1000000000);
    currentvalue := currentvalue*(1.00001 ** Float.fromInt(timeElappsedS));
    startTime := currentTime;
    };


};
