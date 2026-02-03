public class BubbleSortExample {
    static void Main() {
        int[] arr = {1, 48, 24, -3, 50, 17, -25, 28};
        int n = arr.Length;
        for (int i = 0; i < n-1; i++) {
            for (int j = 0; j < n-i-1; j++) {

                
                if (arr[j] > arr[j+1]) {
                    // for the looping 
                    // 
                    printArray(arr);
                    Console.WriteLine("");
                    // ^^^^^^^^^^^^^^^^^

                    // swap arr[j] and arr[j+1]
                    int temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
        Console.WriteLine("Sorted array:");
        printArray(arr);
    }

    static void printArray(int[] arr) {
        for (int i = 0; i < arr.Length; i++) {
            Console.Write(arr[i]+" ");
        }
    }
}