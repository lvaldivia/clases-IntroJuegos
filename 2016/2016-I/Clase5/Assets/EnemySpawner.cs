using UnityEngine;
using System.Collections;

public class EnemySpawner : MonoBehaviour {

	// Use this for initialization
	public GameObject[] elements;
	void Start () {
		for(int i=0;i<elements.Length;i++){
			print (elements [i].gameObject.name);
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
