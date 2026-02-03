using System;

class Program
{
    static void Main()
    {
        int[] array = { 1, 48, 24, -3, 50, 1 };
        int n = array.Length;

        // Sort array using selection sort
        for (int i = 0; i < n - 1; i++)
        {
            int minIndex = i;

            for (int j = i + 1; j < n; j++)
            {
                if (array[j] < array[minIndex])
                {
                    minIndex = j;
                }
            }

            // Swap the found minimum element with the first element
            int temp = array[minIndex];
            array[minIndex] = array[i];
            array[i] = temp;
        }

        // Display the sorted array
        Console.Write("Sorted array: ");
        foreach (var item in array)
        {
            Console.Write(item + " ");
        }
    }
}
