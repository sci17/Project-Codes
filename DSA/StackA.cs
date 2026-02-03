using System;

namespace StackS
{
	public class StackA
	{
		int[] S;
		int top = 0;

		public StackA(int size)
		{
			S = new int[size];
			top = -1;
		}

		public StackA() {
			S = new int[5];
			top = -1;
		}

		public void Push(int val)
		{


			if (!IsFull())
			{
                top++;
                S[top] = val;
				
			}
		}

		public int Pop()
		{
			int val = 0;
			if (IsEmpty() == false)
			{
				val = S[top];
				top--;
			}
			return val;
		}

		public bool IsFull()
		{
			bool check = false;

			if (top == S.Length - 1)
			{
				check = true;
				Console.WriteLine("Stack is Full");
			}

			return check;
		}

		public bool IsEmpty()
		{
			bool check = false;
			if (top == -1)
			{
				check = true;
				Console.WriteLine("Stack is Empty");
			}
			return check;
		}
	}
}