
cbuffer constant {
    float4x4 model;
    float4x4 view;
    float4x4 projection;
};

struct vs_out {
    float4 position : SV_POSITION; 
    float4 color : COLOR; 
};

vs_out main(float3 inPos : POSITION, float4 inColor : COLOR) {
    vs_out output;

    float4 position = float4(inPos, 1.0);

    output.position = mul(mul(mul(projection, view), model), position);
    output.color = inColor;

    return output;
}
