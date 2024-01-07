#include <iostream>
#include <string>
using namespace std;

int makeNumber(int d1, int d2, int d3, int d4){
      int number;
      number = d1*1000 + d2*100 + d3*10 + d4;

      return number;
      }

string isEven(int number){
      string test;
      if (number % 2 == 0){
         test = " is even";
         }
      else {
         test = " is odd";
         }
      
      return test;
      }

int reverseNumber(int number){
      int backwards;
      int thousand;
      int hundred;
      int tens;
      int ones;

      ones = number/1000;
      tens = (number/100)%10;
      hundred = ((number/10)%100)%10;
      thousand = ((number%1000)%100)%10;

      backwards = thousand*1000 + hundred*100 + tens*10 + ones;

      return backwards;
      }

string isPalindrome(int number){
    string pali;
    int thousand;
    int hundred;
    int tens;
    int ones;

    ones = number/1000;
    tens = (number/100)%10;
    hundred = ((number/10)%100)%10;
    thousand = ((number%1000)%100)%10;
    if (ones == thousand && tens == hundred) {
        pali = " is a palindrome";
    }
    else {
        pali = " is not a palindrome";
    }

return pali;
}

int main() {
   int num1;
   int num2;
   int num3;
   int num4;
   int numberfull;

   cin >> num1 >> num2 >> num3 >> num4;

    numberfull = makeNumber(num1, num2, num3, num4);
      

    cout << numberfull << endl;
    cout << numberfull << isEven(numberfull) << endl;
    cout << reverseNumber(numberfull) << endl;
    cout << numberfull << isPalindrome(numberfull) << endl;

   return 0;
}
