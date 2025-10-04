

import 'package:flutter/material.dart';
import 'bottomnavbar.dart';





class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => Userdetailspage();
}



class Userdetailspage extends State<Userdetails> {
  bool test = false;
   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 3, 4, 43),
            Color.fromARGB(255, 6, 19, 134),
          ],
        ),
        
      ),
      child: Scaffold(
        appBar:AppBar(
          flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                 Color.fromARGB(255, 6, 19, 134),
                Color.fromARGB(255, 3, 4, 43),
               
              ],
            ),
          ),
        ),
          
          leading: IconButton(onPressed: (){
            Navigator.pushReplacement(context,
             MaterialPageRoute(
              builder: (context) => Bottomnavbar()
              )
            
             );

          }, 
          icon: Icon(Icons.arrow_back),color: Colors.white,iconSize: 25,),
        ) ,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 500,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:5 ,bottom: 5),
                  child: Text("Username :username",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Text("Email : email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                  child: Text("FirstName : firstname",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                  child: Text("LastName : lastname",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                  child: Text("Gender : gender",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                
               

              ],
            ),

            
            
             
            
          ),
        ),
      
         
        
      ),
     
    
    
    
  );
  }
}