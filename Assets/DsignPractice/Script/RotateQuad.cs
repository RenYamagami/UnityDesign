using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateQuad : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	float n =0;
	void Update () {

		n += Time.deltaTime;
		this.transform.rotation = Quaternion.Euler (0, n*100, 45);

	}
}
