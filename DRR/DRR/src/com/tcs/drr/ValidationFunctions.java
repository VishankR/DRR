package com.tcs.drr;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationFunctions 
{
	//for aadhar card
	  static int[][] d  = new int[][]
              {
                      {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
                      {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
                      {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
                      {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
                      {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
                      {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
                      {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
                      {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
                      {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
                      {9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
              };
      static int[][] p = new int[][]
              {
                      {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
                      {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
                      {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
                      {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
                      {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
                      {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
                      {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
                      {7, 0, 4, 6, 9, 1, 3, 2, 5, 8}
              };
      static int[] inv = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};
      
	//phn no. validation function
	
	 public boolean isValidPhn(String s)
	    {
	        Pattern p = Pattern.compile("(0/91)?[6-9][0-9]{9}");
	        Matcher m = p.matcher(s);
	        return (m.find() && m.group().equals(s));
	    }
	 
	//email validation function
	 
	 public boolean isValidEmail(String email)
	    {
	        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
	                            "[a-zA-Z0-9_+&*-]+)*@" +
	                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
	                            "A-Z]{2,7}$";
	                             
	        Pattern pat = Pattern.compile(emailRegex);
	        if (email == null)
	            return false;
	        return pat.matcher(email).matches();
	    }
	 
	//aadhar card vaidation functions
	 
	  public boolean validateVerhoeff(String num){
          int c = 0;
          int[] myArray = StringToReversedIntArray(num);
          for (int i = 0; i < myArray.length; i++){
              c = d[c][p[(i % 8)][myArray[i]]];
          }

          return (c == 0);
      }
      private int[] StringToReversedIntArray(String num){
          int[] myArray = new int[num.length()];
          for(int i = 0; i < num.length(); i++){
              myArray[i] = Integer.parseInt(num.substring(i, i + 1));
          }
          myArray = Reverse(myArray);
          return myArray;
      }
      private int[] Reverse(int[] myArray){
          int[] reversed = new int[myArray.length];
          for(int i = 0; i < myArray.length ; i++){
              reversed[i] = myArray[myArray.length - (i + 1)];
          }
          return reversed;
      }
      
      public boolean validateAadharNumber(String aadharNumber){
          Pattern aadharPattern = Pattern.compile("\\d{12}");
          boolean isValidAadhar = aadharPattern.matcher(aadharNumber).matches();
          if(isValidAadhar){
              isValidAadhar =validateVerhoeff(aadharNumber);
          }
          return isValidAadhar;
      }
	
	//pan card validation function
      
      public boolean isValidPan(String s)
      {
    	  Pattern pattern = Pattern.compile("[A-Z]{5}[0-9]{4}[A-Z]{1}");
    	  Matcher matcher = pattern.matcher(s);
    	  if (matcher.matches()) 
    	  {
    		  return true;
    	  } 
    	  else
    		  return false;
    	  
      }
	
}
