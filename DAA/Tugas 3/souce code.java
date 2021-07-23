package sortingcomparison;
/**
 *
 * @author Muhammad Nanda Setiawan
 */
public class SortingComparison {
    public static void main(String[] args) {        
        int[] input_n ={20, 50, 200, 500, 1000, 10000, 100000, 500000, 1000000, 2000000};
        int[] sampel_awal = new int[20];
        int[] sampel_alg1_akhir = new int[20];
        int[] sampel_alg2_akhir = new int[20];
        int[] sampel_alg3_akhir = new int[20];
        int[] sampel_alg4_akhir = new int[20];
        int[] sampel_alg5_akhir = new int[20];        
        
		System.out.println("Perbandingan Runnung Time hasil implementasi 5 Algoritma Sorting untuk beberapa ukuran input N");

		//tabel awal
		String s="n    ";       
		System.out.println("========================================================================================================================================================================");
		System.out.println("| " +String.format("%9S",s) +" |" 
				 +"\t" +String.format("%17s",("Bubble Sort "))+ " \t|" 
				 +"\t" +String.format("%17s",("Insertion Sort "))+ " \t|" 
				 +"\t" +String.format("%17s",("Merge Sort "))+ " \t|" 
				 +"\t" +String.format("%17s",("Quick Sort "))+ " \t|" 
				 +"\t" +String.format("%17s",("Heap Sort "))+ " \t|"                 
		);   
		System.out.println("=========================================================================================================================================================================");
				
		//proses utama
		for (int n:input_n){         
			//inisialisasi array untu digunakan disetiap algoritma
			int[] arr_alg1 = new int[n];
			int[] arr_alg2 = new int[n];
			int[] arr_alg3 = new int[n];
			int[] arr_alg4 = new int[n];
			int[] arr_alg5 = new int[n];        

			/*membangkitkan angka acak agar menghailkan input yang sama disetiap array untuk diimplementasikan disetiap Algoritma Sorting*/        
			for (int i=0; i<n; i++){
				int a= (int)(Math.random()*(2*n+1))+(-n);
				arr_alg1[i]=arr_alg2[i]=arr_alg3[i]=arr_alg4[i]=arr_alg5[i]=a;     
				if (n==20)
					sampel_awal[i]=a;
			}
					
			//Proses penggunaan algoritma dan pencatatan running time-nya
			System.out.print("| " +String.format("%9d",n) +" |");
			float a, b, c;           
			a = System.nanoTime();
			BubbleSort(arr_alg1, n);
			b = System.nanoTime();
			System.out.print("\t" +RunningTime(a,b) +"\t|");
					
			a = System.nanoTime();
			InsertionSort(arr_alg2, n);
			b = System.nanoTime();
			System.out.print("\t" +RunningTime(a,b) +"\t|");
			
			a = System.nanoTime();
			MergeSort(arr_alg3, 0, n-1);
			b = System.nanoTime();
			System.out.print("\t" +RunningTime(a,b) +"\t|");
			
			a = System.nanoTime();
			QuickSort(arr_alg4, 0, n-1);
			b = System.nanoTime();
			System.out.print("\t" +RunningTime(a,b) +"\t|");
					
			a = System.nanoTime();
			HeapSort(arr_alg5, n);
			b = System.nanoTime();
			System.out.print("\t" +RunningTime(a,b) +"\t|");            
			System.out.println("");
					
			//untuk sampel hasil sorting tiap algoritma
			if (n==20){
				isi(arr_alg1, sampel_alg1_akhir);
				isi(arr_alg2, sampel_alg2_akhir);
				isi(arr_alg3, sampel_alg3_akhir);
				isi(arr_alg4, sampel_alg4_akhir);
				isi(arr_alg5, sampel_alg5_akhir);                
			}         
		}
		System.out.println("=========================================================================================================================================================================");
		System.out.print("\n\nSampel Array Awal untuk n=20 \t: { ");
		PrintSample(sampel_awal);
		System.out.print("}");        
		System.out.print("\n\t1. Hasil Sorting dgn Algoritma Bubble Sort\t : ");
		PrintSample(sampel_alg1_akhir);
		System.out.print("\n\t2. Hasil Sorting dgn Algoritma Insertion Sort\t : ");
		PrintSample(sampel_alg2_akhir);
		System.out.print("\n\t3. Hasil Sorting dgn Algoritma Merge Sort\t : ");
		PrintSample(sampel_alg3_akhir);
		System.out.print("\n\t4. Hasil Sorting dgn Algoritma Hasil Quick Sort\t : ");
		PrintSample(sampel_alg4_akhir);
		System.out.print("\n\t5. Hasil Sorting dgn Algoritma Heap Sort\t : ");
		PrintSample(sampel_alg5_akhir);
		System.out.println("");        
	}	
			
	public static void isi (int[] awal, int[] akhir){
		for (int i=0; i<awal.length; i++)
			akhir[i]=awal[i];        
	}
			
	public static void PrintSample (int[] arr){
		for (int i=1; i<=arr.length; i++)
			System.out.print(arr[i-1]+" ");                    
	}
			
	public static String RunningTime(float a, float b){
		float c = (b-a)/1000000000;
		if (c<60)
			return ""+String.format("%12.9f", c) +" det";
		else if (c<3600)
			return ""+String.format("%12.9f",(c/60)) +" mnt";
		else
			return ""+String.format("%12.9f",(c/3600)) +" jam";        
	}

	public static void BubbleSort(int[] arr, int length){        
		for (int i=0; i<length; i++){
			for (int j=0; j<length-1; j++){
				if (arr[j]>arr[j+1]){
					int temp = arr[j];
					arr[j]= arr[j+1];
					arr[j+1]=temp;
				}
			}
		}
	}
		
	public static int[] InsertionSort(int[] arr, int n){        
		for (int j=1; j<n; j++){
			int key = arr[j];
			int i=j-1;
			while(arr[i]>key && i>=0){
				arr[i+1]=arr[i];
				i--;
			}
			arr[i+1]=key;
		}
		return arr;
	}
			
	public static void MergeSort(int A[], int l, int r){
		if(l<r){
			int m = (l+r)/2;
			MergeSort(A, l,m);
			MergeSort(A, m+1, r);
			merge(A, l, m, r);
		}
	}
	public static void merge(int[]A, int l, int m, int r){
		int p1 = m-l+1;
		int p2 = r-m; //r-p1      
		  
		//mendefinisikan dua buah array kosong untuk hasil split array utama
		int Kr[]=new int [p1];
		int Kn[]=new int [p2];  
			  
		//split/membagi array yg besar ke dalam dua buah array 
		for (int i=0; i<p1; i++)
			Kr[i]= A[l+i];
			for (int i=0; i<p2; i++)
				Kn[i]= A[m+1+i];        
		int j=0,i=0,k=l;    
			
		//proses merge-nya
		while(i<p1 && j<p2){
			if (Kr[i] <= Kn[j]){
				A[k]=Kr[i];
				i++;
			}
			else{
				A[k]=Kn[j];
				j++;
			}
			k++;            
		}        

		//menambah sisa elemen array Kr ke array hasil merge
		while(i<p1){            
			A[k]=Kr[i];
			i++;
			k++;
		}

		//menambah sisa elemen array Kn ke array hasil merge
		while(j<p2){
			A[k]=Kn[j];
			j++;
			k++;
			}
		}    

	public static void QuickSort(int[] arr, int p , int r){
		if (p<r){
			int q = Partition(arr, p, r);
			QuickSort(arr, p, q-1);
			QuickSort(arr, q+1, r);            
		}
	}
	public static int Partition(int[] arr, int p, int r){
		int x = arr[r];       
		int i = p-1;
				
		for (int j=p; j<r; j++){
			if (arr[j]<=x){
				i++;
				int exc = arr[i];
				arr[i] = arr[j];
				arr[j] = exc;
			}
		}
				
		int exc = arr[i+1];
		arr[i+1] = arr[r];
		arr[r] = exc;
		return i+1;
	}
			
	public static void HeapSort (int[] arr, int length){        
		int largest;
		BuildMaxHeap(arr);
		
		for (int i=length-1; i>0; i--){
			largest = arr[0];
			arr[0] = arr[i];
			arr[i] = largest;            
			MaxHeapify(arr, i, 0);       
		}
	}	
	public static void BuildMaxHeap (int[] arr){
		int length = arr.length;
	    for (int i=length/2-1; i>=0; i--)
		MaxHeapify(arr, length, i);       
	}
	public static void MaxHeapify(int[] arr, int n, int i){
		int l=2*i+1;
		int r=2*i+2;        
		int largest, largest_val;
			
		if (l<n && arr[l]>arr[i])
			largest = l;
		else
			largest=i;
		if (r<n && arr[r]>arr[largest])
			largest = r;
		if (largest!=i){
			largest_val = arr[largest];
			arr[largest] = arr[i];
			arr[i] = largest_val;
			MaxHeapify(arr, n, largest);
		}        
	}        
}