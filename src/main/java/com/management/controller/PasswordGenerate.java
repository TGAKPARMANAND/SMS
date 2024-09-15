package com.management.controller;
import java.util.Date;
import java.util.Random;
public class PasswordGenerate
{
  private static Random random = new Random(new Date().getTime());
 
  public static String generateRandomString(int paramInt)
  {
    char[] arrayOfChar = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
   
    String str = "";
    for (int i = 0; i < paramInt; i++)
    {
      int j = random.nextInt(arrayOfChar.length);
      str = str + arrayOfChar[j];
    }
    return str;
  }
}
