#include <iostream>
#include <vector>
#include <iterator>
using namespace std;

vector <long long> findDividers(long long number)
{
	vector<long long> dividers;

	for (int i = 2; i <= sqrt(number); i++)
	{
		if (number % i == 0)
		{
			dividers.push_back(i);
			if (i * i != number)
			{
				dividers.push_back(number / i);
			}
		}
	}

	return dividers;
}

void printDividers(vector <long long> dvdrs, long long number)
{
	int i = 0;
	cout << "Number for which find dividers: " << number << endl;
	for (vector<long long>::iterator it = dvdrs.begin(); it != dvdrs.end(); ++it, ++i)
		cout << i << " divider : " << *it << endl;
}

int main()
{
	long long number = 10e16;
	vector<long long> vct = findDividers(number);
	
	return 0;
}