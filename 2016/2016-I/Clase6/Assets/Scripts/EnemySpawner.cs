using UnityEngine;
using System.Collections;

public class EnemySpawner : MonoBehaviour {

	// Use this for initialization
	public GameObject[] elements;
	float elapsed;
	float creationTime;
	void Start () {
		elapsed = 0;
		creationTime = Random.Range (1.5f, 3.5f);
	}

	void Update () {
		elapsed += Time.deltaTime;
		if (elapsed >= creationTime) {
			creationTime = Random.Range (1.5f, 3.5f);
			elapsed = 0;
			int random = Random.Range (0, elements.Length);
			Instantiate (elements [random], 
						transform.position, transform.rotation);

		}
	}
}
