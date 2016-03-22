using UnityEngine;
using System.Collections;

public class MiPrimeraVez : MonoBehaviour
{

	// Use this for initialization
	public float numero1;
	public float numero2;

	void Start ()
	{
		/*print ("Holi :D");
		Debug.Log ("Holi :d");
		float r = Sumar ();
		Debug.Log ("resultado " + r);
		ObtenerPares ();*/


	}

	float Sumar(){
		return numero1 + numero2;
	}

	void ObtenerPares(){
		for (int i = 1; i < 11; i++) {
			if (i % 2 == 0) {
				print (" Es par " + i);
			} else {

			}
		}
	}
	
	// Update is called once per frame
	void Update ()
	{
	}
}
