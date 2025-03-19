Shader "Unlit/Shader_jeanCMaker_UnlitTransparent/HDR"
{
    Properties
    {
        [HDR]_Color ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType" = "Transparent" }
        ZWrite On
        Lighting Off
        Fog { Mode Off }

        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            Color [_Color]
            SetTexture [_MainTex]
			{
				combine texture * primary 
            }
        }
    }
}
