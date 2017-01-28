Shader "Custom/SimpleRot" {
	Properties {
		_MainTex ("Particle Texture", 2D) = "white" {}
		_Main2Texture("Particle Texture", 2D) = "white" {}
		_rotate("Rotation",Range (1, 360)) = 10
	}
	
	SubShader {
		Tags{ "Queue" = "Transparent" }
Blend SrcAlpha OneMinusSrcAlpha

		Pass {
						Cull back
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
				
			#include "UnityCG.cginc"
			#define PI 3.14159265359

			sampler2D _MainTex;
			float _rotate;
			struct v2f {
				float4 pos : POSITION;
				fixed4 col : COLOR;
				float2 uv : TEXCOORD0;
			};
			
			v2f vert (appdata_base v)
			{
				float _RotationSpeed = 2.0;
				float sinX = sin ( _RotationSpeed * _Time.z );
				float cosX = cos ( _RotationSpeed * _Time.z );
				float sinY = sin ( _RotationSpeed * _Time.z );
				//float2x2 rotationMatrix = float2x2( cosX, -sinX, sinY, cosX);

				v.texcoord.xy -= 0.5;
				//v.texcoord.xy = mul ( v.texcoord.xy, rotationMatrix );
				v.texcoord.xy += 0.5;
				
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = float2(v.texcoord.x, v.texcoord.y);
				return o;
			}
			
			half4 frag (v2f i) : COLOR
			{
			float scale =0.69;
				float uvX = (i.uv.x*scale)*cos(_rotate)+(i.uv.y*scale)*sin(_rotate)-0.5;
				float uvY = -(i.uv.x*scale)*sin(_rotate)+(i.uv.y*scale)*cos(_rotate);


				half4 col = tex2D(_MainTex, float2(uvX,uvY));


				return col;
			}
			ENDCG
		}


	pass {	
							Cull front

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
				
			#include "UnityCG.cginc"
			#define PI 3.14159265359

			sampler2D _Main2Texture;
		float _rotate;
			struct v2f {
				float4 pos : POSITION;
				fixed4 col : COLOR;
				float2 uv : TEXCOORD0;
			};
			
			v2f vert (appdata_base v)
			{
				float _RotationSpeed = 2.0;
				float sinX = sin ( _RotationSpeed * _Time.z );
				float cosX = cos ( _RotationSpeed * _Time.z );
				float sinY = sin ( _RotationSpeed * _Time.z );
				//float2x2 rotationMatrix = float2x2( cosX, -sinX, sinY, cosX);

				v.texcoord.xy -= 0.5;
				//v.texcoord.xy = mul ( v.texcoord.xy, rotationMatrix );
				v.texcoord.xy += 0.5;
				
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = float2(v.texcoord.x, v.texcoord.y);
				return o;
			}
			
			half4 frag (v2f i) : COLOR
			{
			float scale =0.69;
				float uvX = (i.uv.x*scale)*cos(_rotate)+(i.uv.y*scale)*sin(_rotate)-0.5;
				float uvY = -(i.uv.x*scale)*sin(_rotate)+(i.uv.y*scale)*cos(_rotate);


				half4 col = tex2D(_Main2Texture, float2(uvX,uvY));


				return col;
			}
			ENDCG
		}
		}
}


