Shader "Custom/UnlitSkySphere_Alpha"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Alpha ("Alpha", Range(0,1)) = 1.0  // Alpha 값을 조절하는 속성 추가
    }

    SubShader
    {
        Tags { "RenderPipeline" = "UniversalRenderPipeline" "Queue" = "Transparent" }
        Pass
        {
            Name "UnlitPass"
            Tags { "LightMode" = "UniversalForward" }

            Cull Off   // 내부에서도 보이도록 설정
            ZWrite Off  // 투명도 적용을 위해 ZWrite 끄기
            Blend SrcAlpha OneMinusSrcAlpha  // Alpha Blending 적용

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
            float _Alpha;  // Alpha 값 조절

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
                texColor.a *= _Alpha;  // Alpha 값 적용
                return texColor;
            }
            ENDHLSL
        }
    }
}
