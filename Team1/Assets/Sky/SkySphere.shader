Shader "Custom/UnlitSkySphere_Alpha"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Alpha ("Alpha", Range(0,1)) = 1.0  // Alpha ���� �����ϴ� �Ӽ� �߰�
    }

    SubShader
    {
        Tags { "RenderPipeline" = "UniversalRenderPipeline" "Queue" = "Transparent" }
        Pass
        {
            Name "UnlitPass"
            Tags { "LightMode" = "UniversalForward" }

            Cull Off   // ���ο����� ���̵��� ����
            ZWrite Off  // ���� ������ ���� ZWrite ����
            Blend SrcAlpha OneMinusSrcAlpha  // Alpha Blending ����

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            float _Alpha;  // Alpha �� ����

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = IN.uv;
                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                half4 texColor = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, IN.uv);
                texColor.a *= _Alpha;  // Alpha �� ����
                return texColor;
            }
            ENDHLSL
        }
    }
}
