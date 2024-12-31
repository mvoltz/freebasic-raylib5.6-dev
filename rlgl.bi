#pragma once

''#include once "stdbool.bi"

extern "C"

#define RLGL_H
#define RLGL_VERSION "5.0"
#define RLAPI
''#define TRACELOG(level, __VA_ARGS__...) 0
#define TRACELOGD(__VA_ARGS__...) 0
''#define RL_MALLOC(sz) malloc(sz)
''#define RL_CALLOC(n, sz) calloc(n, sz)
''#define RL_REALLOC(n, sz) realloc(n, sz)
''#define RL_FREE(p) free(p)
#define GRAPHICS_API_OPENGL_33
#define RLGL_RENDER_TEXTURES_HINT
const RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 8192
const RL_DEFAULT_BATCH_BUFFERS = 1
const RL_DEFAULT_BATCH_DRAWCALLS = 256
const RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS = 4
const RL_MAX_MATRIX_STACK_SIZE = 32
const RL_MAX_SHADER_LOCATIONS = 32
const RL_CULL_DISTANCE_NEAR = 0.01
const RL_CULL_DISTANCE_FAR = 1000.0
const RL_TEXTURE_WRAP_S = &h2802
const RL_TEXTURE_WRAP_T = &h2803
const RL_TEXTURE_MAG_FILTER = &h2800
const RL_TEXTURE_MIN_FILTER = &h2801
const RL_TEXTURE_FILTER_NEAREST = &h2600
const RL_TEXTURE_FILTER_LINEAR = &h2601
const RL_TEXTURE_FILTER_MIP_NEAREST = &h2700
const RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = &h2702
const RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = &h2701
const RL_TEXTURE_FILTER_MIP_LINEAR = &h2703
const RL_TEXTURE_FILTER_ANISOTROPIC = &h3000
const RL_TEXTURE_MIPMAP_BIAS_RATIO = &h4000
const RL_TEXTURE_WRAP_REPEAT = &h2901
const RL_TEXTURE_WRAP_CLAMP = &h812F
const RL_TEXTURE_WRAP_MIRROR_REPEAT = &h8370
const RL_TEXTURE_WRAP_MIRROR_CLAMP = &h8742
const RL_MODELVIEW = &h1700
const RL_PROJECTION = &h1701
const RL_TEXTURE = &h1702
const RL_LINES = &h0001
const RL_TRIANGLES = &h0004
const RL_QUADS = &h0007
const RL_UNSIGNED_BYTE = &h1401
const RL_FLOAT = &h1406
const RL_STREAM_DRAW = &h88E0
const RL_STREAM_READ = &h88E1
const RL_STREAM_COPY = &h88E2
const RL_STATIC_DRAW = &h88E4
const RL_STATIC_READ = &h88E5
const RL_STATIC_COPY = &h88E6
const RL_DYNAMIC_DRAW = &h88E8
const RL_DYNAMIC_READ = &h88E9
const RL_DYNAMIC_COPY = &h88EA
const RL_FRAGMENT_SHADER = &h8B30
const RL_VERTEX_SHADER = &h8B31
const RL_COMPUTE_SHADER = &h91B9
const RL_ZERO = 0
const RL_ONE = 1
const RL_SRC_COLOR = &h0300
const RL_ONE_MINUS_SRC_COLOR = &h0301
const RL_SRC_ALPHA = &h0302
const RL_ONE_MINUS_SRC_ALPHA = &h0303
const RL_DST_ALPHA = &h0304
const RL_ONE_MINUS_DST_ALPHA = &h0305
const RL_DST_COLOR = &h0306
const RL_ONE_MINUS_DST_COLOR = &h0307
const RL_SRC_ALPHA_SATURATE = &h0308
const RL_CONSTANT_COLOR = &h8001
const RL_ONE_MINUS_CONSTANT_COLOR = &h8002
const RL_CONSTANT_ALPHA = &h8003
const RL_ONE_MINUS_CONSTANT_ALPHA = &h8004
const RL_FUNC_ADD = &h8006
const RL_MIN = &h8007
const RL_MAX = &h8008
const RL_FUNC_SUBTRACT = &h800A
const RL_FUNC_REVERSE_SUBTRACT = &h800B
const RL_BLEND_EQUATION = &h8009
const RL_BLEND_EQUATION_RGB = &h8009
const RL_BLEND_EQUATION_ALPHA = &h883D
const RL_BLEND_DST_RGB = &h80C8
const RL_BLEND_SRC_RGB = &h80C9
const RL_BLEND_DST_ALPHA = &h80CA
const RL_BLEND_SRC_ALPHA = &h80CB
const RL_BLEND_COLOR = &h8005
const RL_READ_FRAMEBUFFER = &h8CA8
const RL_DRAW_FRAMEBUFFER = &h8CA9
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION = 0
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD = 1
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL = 2
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR = 3
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT = 4
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 = 5
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES = 6
const RL_DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCE_TX = 9

''type Matrix
''	m0 as single
''	m4 as single
''	m8 as single
''	m12 as single
''	m1 as single
''	m5 as single
''	m9 as single
''	m13 as single
''	m2 as single
''	m6 as single
''	m10 as single
''	m14 as single
''	m3 as single
''	m7 as single
''	m11 as single
''	m15 as single
''end type

#define RL_MATRIX_TYPE

type rlVertexBuffer
	elementCount as long
	vertices as single ptr
	texcoords as single ptr
	normals as single ptr
	colors as ubyte ptr
	indices as ulong ptr
	vaoId as ulong
	vboId(0 to 4) as ulong
end type

type rlDrawCall
	mode as long
	vertexCount as long
	vertexAlignment as long
	textureId as ulong
end type

type rlRenderBatch
	bufferCount as long
	currentBuffer as long
	vertexBuffer as rlVertexBuffer ptr
	draws as rlDrawCall ptr
	drawCounter as long
	currentDepth as single
end type

type rlGlVersion as long
enum
	RL_OPENGL_11 = 1
	RL_OPENGL_21
	RL_OPENGL_33
	RL_OPENGL_43
	RL_OPENGL_ES_20
	RL_OPENGL_ES_30
end enum

type rlTraceLogLevel as long
enum
	RL_LOG_ALL = 0
	RL_LOG_TRACE
	RL_LOG_DEBUG
	RL_LOG_INFO
	RL_LOG_WARNING
	RL_LOG_ERROR
	RL_LOG_FATAL
	RL_LOG_NONE
end enum

type rlPixelFormat as long
enum
	RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1
	RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA
	RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5
	RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8
	RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1
	RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4
	RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8
	RL_PIXELFORMAT_UNCOMPRESSED_R32
	RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32
	RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32
	RL_PIXELFORMAT_UNCOMPRESSED_R16
	RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16
	RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16A16
	RL_PIXELFORMAT_COMPRESSED_DXT1_RGB
	RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA
	RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA
	RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA
	RL_PIXELFORMAT_COMPRESSED_ETC1_RGB
	RL_PIXELFORMAT_COMPRESSED_ETC2_RGB
	RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA
	RL_PIXELFORMAT_COMPRESSED_PVRT_RGB
	RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA
	RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA
	RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA
end enum

type rlTextureFilter as long
enum
	RL_TEXTURE_FILTER_POINT = 0
	RL_TEXTURE_FILTER_BILINEAR
	RL_TEXTURE_FILTER_TRILINEAR
	RL_TEXTURE_FILTER_ANISOTROPIC_4X
	RL_TEXTURE_FILTER_ANISOTROPIC_8X
	RL_TEXTURE_FILTER_ANISOTROPIC_16X
end enum

type rlBlendMode as long
enum
	RL_BLEND_ALPHA = 0
	RL_BLEND_ADDITIVE
	RL_BLEND_MULTIPLIED
	RL_BLEND_ADD_COLORS
	RL_BLEND_SUBTRACT_COLORS
	RL_BLEND_ALPHA_PREMULTIPLY
	RL_BLEND_CUSTOM
	RL_BLEND_CUSTOM_SEPARATE
end enum

type rlShaderLocationIndex as long
enum
	RL_SHADER_LOC_VERTEX_POSITION = 0
	RL_SHADER_LOC_VERTEX_TEXCOORD01
	RL_SHADER_LOC_VERTEX_TEXCOORD02
	RL_SHADER_LOC_VERTEX_NORMAL
	RL_SHADER_LOC_VERTEX_TANGENT
	RL_SHADER_LOC_VERTEX_COLOR
	RL_SHADER_LOC_MATRIX_MVP
	RL_SHADER_LOC_MATRIX_VIEW
	RL_SHADER_LOC_MATRIX_PROJECTION
	RL_SHADER_LOC_MATRIX_MODEL
	RL_SHADER_LOC_MATRIX_NORMAL
	RL_SHADER_LOC_VECTOR_VIEW
	RL_SHADER_LOC_COLOR_DIFFUSE
	RL_SHADER_LOC_COLOR_SPECULAR
	RL_SHADER_LOC_COLOR_AMBIENT
	RL_SHADER_LOC_MAP_ALBEDO
	RL_SHADER_LOC_MAP_METALNESS
	RL_SHADER_LOC_MAP_NORMAL
	RL_SHADER_LOC_MAP_ROUGHNESS
	RL_SHADER_LOC_MAP_OCCLUSION
	RL_SHADER_LOC_MAP_EMISSION
	RL_SHADER_LOC_MAP_HEIGHT
	RL_SHADER_LOC_MAP_CUBEMAP
	RL_SHADER_LOC_MAP_IRRADIANCE
	RL_SHADER_LOC_MAP_PREFILTER
	RL_SHADER_LOC_MAP_BRDF
end enum

const RL_SHADER_LOC_MAP_DIFFUSE = RL_SHADER_LOC_MAP_ALBEDO
const RL_SHADER_LOC_MAP_SPECULAR = RL_SHADER_LOC_MAP_METALNESS

type rlShaderUniformDataType as long
enum
	RL_SHADER_UNIFORM_FLOAT = 0
	RL_SHADER_UNIFORM_VEC2
	RL_SHADER_UNIFORM_VEC3
	RL_SHADER_UNIFORM_VEC4
	RL_SHADER_UNIFORM_INT
	RL_SHADER_UNIFORM_IVEC2
	RL_SHADER_UNIFORM_IVEC3
	RL_SHADER_UNIFORM_IVEC4
	RL_SHADER_UNIFORM_UINT
	RL_SHADER_UNIFORM_UIVEC2
	RL_SHADER_UNIFORM_UIVEC3
	RL_SHADER_UNIFORM_UIVEC4
	RL_SHADER_UNIFORM_SAMPLER2D
end enum

type rlShaderAttributeDataType as long
enum
	RL_SHADER_ATTRIB_FLOAT = 0
	RL_SHADER_ATTRIB_VEC2
	RL_SHADER_ATTRIB_VEC3
	RL_SHADER_ATTRIB_VEC4
end enum

type rlFramebufferAttachType as long
enum
	RL_ATTACHMENT_COLOR_CHANNEL0 = 0
	RL_ATTACHMENT_COLOR_CHANNEL1 = 1
	RL_ATTACHMENT_COLOR_CHANNEL2 = 2
	RL_ATTACHMENT_COLOR_CHANNEL3 = 3
	RL_ATTACHMENT_COLOR_CHANNEL4 = 4
	RL_ATTACHMENT_COLOR_CHANNEL5 = 5
	RL_ATTACHMENT_COLOR_CHANNEL6 = 6
	RL_ATTACHMENT_COLOR_CHANNEL7 = 7
	RL_ATTACHMENT_DEPTH = 100
	RL_ATTACHMENT_STENCIL = 200
end enum

type rlFramebufferAttachTextureType as long
enum
	RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0
	RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1
	RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2
	RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3
	RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4
	RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5
	RL_ATTACHMENT_TEXTURE2D = 100
	RL_ATTACHMENT_RENDERBUFFER = 200
end enum

type rlCullMode as long
enum
	RL_CULL_FACE_FRONT = 0
	RL_CULL_FACE_BACK
end enum

declare sub rlMatrixMode(byval mode as long)
declare sub rlPushMatrix()
declare sub rlPopMatrix()
declare sub rlLoadIdentity()
declare sub rlTranslatef(byval x as single, byval y as single, byval z as single)
declare sub rlRotatef(byval angle as single, byval x as single, byval y as single, byval z as single)
declare sub rlScalef(byval x as single, byval y as single, byval z as single)
declare sub rlMultMatrixf(byval matf as const single ptr)
declare sub rlFrustum(byval left as double, byval right as double, byval bottom as double, byval top as double, byval znear as double, byval zfar as double)
declare sub rlOrtho(byval left as double, byval right as double, byval bottom as double, byval top as double, byval znear as double, byval zfar as double)
declare sub rlViewport(byval x as long, byval y as long, byval width as long, byval height as long)
declare sub rlSetClipPlanes(byval nearPlane as double, byval farPlane as double)
declare function rlGetCullDistanceNear() as double
declare function rlGetCullDistanceFar() as double
declare sub rlBegin(byval mode as long)
declare sub rlEnd()
declare sub rlVertex2i(byval x as long, byval y as long)
declare sub rlVertex2f(byval x as single, byval y as single)
declare sub rlVertex3f(byval x as single, byval y as single, byval z as single)
declare sub rlTexCoord2f(byval x as single, byval y as single)
declare sub rlNormal3f(byval x as single, byval y as single, byval z as single)
declare sub rlColor4ub(byval r as ubyte, byval g as ubyte, byval b as ubyte, byval a as ubyte)
declare sub rlColor3f(byval x as single, byval y as single, byval z as single)
declare sub rlColor4f(byval x as single, byval y as single, byval z as single, byval w as single)
declare function rlEnableVertexArray(byval vaoId as ulong) as boolean
declare sub rlDisableVertexArray()
declare sub rlEnableVertexBuffer(byval id as ulong)
declare sub rlDisableVertexBuffer()
declare sub rlEnableVertexBufferElement(byval id as ulong)
declare sub rlDisableVertexBufferElement()
declare sub rlEnableVertexAttribute(byval index as ulong)
declare sub rlDisableVertexAttribute(byval index as ulong)
declare sub rlActiveTextureSlot(byval slot as long)
declare sub rlEnableTexture(byval id as ulong)
declare sub rlDisableTexture()
declare sub rlEnableTextureCubemap(byval id as ulong)
declare sub rlDisableTextureCubemap()
declare sub rlTextureParameters(byval id as ulong, byval param as long, byval value as long)
declare sub rlCubemapParameters(byval id as ulong, byval param as long, byval value as long)
declare sub rlEnableShader(byval id as ulong)
declare sub rlDisableShader()
declare sub rlEnableFramebuffer(byval id as ulong)
declare sub rlDisableFramebuffer()
declare function rlGetActiveFramebuffer() as ulong
declare sub rlActiveDrawBuffers(byval count as long)
declare sub rlBlitFramebuffer(byval srcX as long, byval srcY as long, byval srcWidth as long, byval srcHeight as long, byval dstX as long, byval dstY as long, byval dstWidth as long, byval dstHeight as long, byval bufferMask as long)
declare sub rlBindFramebuffer(byval target as ulong, byval framebuffer as ulong)
declare sub rlEnableColorBlend()
declare sub rlDisableColorBlend()
declare sub rlEnableDepthTest()
declare sub rlDisableDepthTest()
declare sub rlEnableDepthMask()
declare sub rlDisableDepthMask()
declare sub rlEnableBackfaceCulling()
declare sub rlDisableBackfaceCulling()
declare sub rlColorMask(byval r as boolean, byval g as boolean, byval b as boolean, byval a as boolean)
declare sub rlSetCullFace(byval mode as long)
declare sub rlEnableScissorTest()
declare sub rlDisableScissorTest()
declare sub rlScissor(byval x as long, byval y as long, byval width as long, byval height as long)
declare sub rlEnableWireMode()
declare sub rlEnablePointMode()
declare sub rlDisableWireMode()
declare sub rlSetLineWidth(byval width as single)
declare function rlGetLineWidth() as single
declare sub rlEnableSmoothLines()
declare sub rlDisableSmoothLines()
declare sub rlEnableStereoRender()
declare sub rlDisableStereoRender()
declare function rlIsStereoRenderEnabled() as boolean
declare sub rlClearColor(byval r as ubyte, byval g as ubyte, byval b as ubyte, byval a as ubyte)
declare sub rlClearScreenBuffers()
declare sub rlCheckErrors()
declare sub rlSetBlendMode(byval mode as long)
declare sub rlSetBlendFactors(byval glSrcFactor as long, byval glDstFactor as long, byval glEquation as long)
declare sub rlSetBlendFactorsSeparate(byval glSrcRGB as long, byval glDstRGB as long, byval glSrcAlpha as long, byval glDstAlpha as long, byval glEqRGB as long, byval glEqAlpha as long)
declare sub rlglInit(byval width as long, byval height as long)
declare sub rlglClose()
declare sub rlLoadExtensions(byval loader as any ptr)
declare function rlGetVersion() as long
declare sub rlSetFramebufferWidth(byval width as long)
declare function rlGetFramebufferWidth() as long
declare sub rlSetFramebufferHeight(byval height as long)
declare function rlGetFramebufferHeight() as long
declare function rlGetTextureIdDefault() as ulong
declare function rlGetShaderIdDefault() as ulong
declare function rlGetShaderLocsDefault() as long ptr
declare function rlLoadRenderBatch(byval numBuffers as long, byval bufferElements as long) as rlRenderBatch
declare sub rlUnloadRenderBatch(byval batch as rlRenderBatch)
declare sub rlDrawRenderBatch(byval batch as rlRenderBatch ptr)
declare sub rlSetRenderBatchActive(byval batch as rlRenderBatch ptr)
declare sub rlDrawRenderBatchActive()
declare function rlCheckRenderBatchLimit(byval vCount as long) as boolean
declare sub rlSetTexture(byval id as ulong)
declare function rlLoadVertexArray() as ulong
declare function rlLoadVertexBuffer(byval buffer as const any ptr, byval size as long, byval dynamic as boolean) as ulong
declare function rlLoadVertexBufferElement(byval buffer as const any ptr, byval size as long, byval dynamic as boolean) as ulong
declare sub rlUpdateVertexBuffer(byval bufferId as ulong, byval data as const any ptr, byval dataSize as long, byval offset as long)
declare sub rlUpdateVertexBufferElements(byval id as ulong, byval data as const any ptr, byval dataSize as long, byval offset as long)
declare sub rlUnloadVertexArray(byval vaoId as ulong)
declare sub rlUnloadVertexBuffer(byval vboId as ulong)
declare sub rlSetVertexAttribute(byval index as ulong, byval compSize as long, byval type as long, byval normalized as boolean, byval stride as long, byval offset as long)
declare sub rlSetVertexAttributeDivisor(byval index as ulong, byval divisor as long)
declare sub rlSetVertexAttributeDefault(byval locIndex as long, byval value as const any ptr, byval attribType as long, byval count as long)
declare sub rlDrawVertexArray(byval offset as long, byval count as long)
declare sub rlDrawVertexArrayElements(byval offset as long, byval count as long, byval buffer as const any ptr)
declare sub rlDrawVertexArrayInstanced(byval offset as long, byval count as long, byval instances as long)
declare sub rlDrawVertexArrayElementsInstanced(byval offset as long, byval count as long, byval buffer as const any ptr, byval instances as long)
declare function rlLoadTexture(byval data as const any ptr, byval width as long, byval height as long, byval format as long, byval mipmapCount as long) as ulong
declare function rlLoadTextureDepth(byval width as long, byval height as long, byval useRenderBuffer as boolean) as ulong
declare function rlLoadTextureCubemap(byval data as const any ptr, byval size as long, byval format as long, byval mipmapCount as long) as ulong
declare sub rlUpdateTexture(byval id as ulong, byval offsetX as long, byval offsetY as long, byval width as long, byval height as long, byval format as long, byval data as const any ptr)
declare sub rlGetGlTextureFormats(byval format as long, byval glInternalFormat as ulong ptr, byval glFormat as ulong ptr, byval glType as ulong ptr)
declare function rlGetPixelFormatName(byval format as ulong) as const zstring ptr
declare sub rlUnloadTexture(byval id as ulong)
declare sub rlGenTextureMipmaps(byval id as ulong, byval width as long, byval height as long, byval format as long, byval mipmaps as long ptr)
declare function rlReadTexturePixels(byval id as ulong, byval width as long, byval height as long, byval format as long) as any ptr
declare function rlReadScreenPixels(byval width as long, byval height as long) as ubyte ptr
declare function rlLoadFramebuffer() as ulong
declare sub rlFramebufferAttach(byval fboId as ulong, byval texId as ulong, byval attachType as long, byval texType as long, byval mipLevel as long)
declare function rlFramebufferComplete(byval id as ulong) as boolean
declare sub rlUnloadFramebuffer(byval id as ulong)
declare function rlLoadShaderCode(byval vsCode as const zstring ptr, byval fsCode as const zstring ptr) as ulong
declare function rlCompileShader(byval shaderCode as const zstring ptr, byval type as long) as ulong
declare function rlLoadShaderProgram(byval vShaderId as ulong, byval fShaderId as ulong) as ulong
declare sub rlUnloadShaderProgram(byval id as ulong)
declare function rlGetLocationUniform(byval shaderId as ulong, byval uniformName as const zstring ptr) as long
declare function rlGetLocationAttrib(byval shaderId as ulong, byval attribName as const zstring ptr) as long
declare sub rlSetUniform(byval locIndex as long, byval value as const any ptr, byval uniformType as long, byval count as long)
declare sub rlSetUniformMatrix(byval locIndex as long, byval mat as Matrix)
declare sub rlSetUniformMatrices(byval locIndex as long, byval mat as const Matrix ptr, byval count as long)
declare sub rlSetUniformSampler(byval locIndex as long, byval textureId as ulong)
declare sub rlSetShader(byval id as ulong, byval locs as long ptr)
declare function rlLoadComputeShaderProgram(byval shaderId as ulong) as ulong
declare sub rlComputeShaderDispatch(byval groupX as ulong, byval groupY as ulong, byval groupZ as ulong)
declare function rlLoadShaderBuffer(byval size as ulong, byval data as const any ptr, byval usageHint as long) as ulong
declare sub rlUnloadShaderBuffer(byval ssboId as ulong)
declare sub rlUpdateShaderBuffer(byval id as ulong, byval data as const any ptr, byval dataSize as ulong, byval offset as ulong)
declare sub rlBindShaderBuffer(byval id as ulong, byval index as ulong)
declare sub rlReadShaderBuffer(byval id as ulong, byval dest as any ptr, byval count as ulong, byval offset as ulong)
declare sub rlCopyShaderBuffer(byval destId as ulong, byval srcId as ulong, byval destOffset as ulong, byval srcOffset as ulong, byval count as ulong)
declare function rlGetShaderBufferSize(byval id as ulong) as ulong
declare sub rlBindImageTexture(byval id as ulong, byval index as ulong, byval format as long, byval readonly as boolean)
declare function rlGetMatrixModelview() as Matrix
declare function rlGetMatrixProjection() as Matrix
declare function rlGetMatrixTransform() as Matrix
declare function rlGetMatrixProjectionStereo(byval eye as long) as Matrix
declare function rlGetMatrixViewOffsetStereo(byval eye as long) as Matrix
declare sub rlSetMatrixProjection(byval proj as Matrix)
declare sub rlSetMatrixModelview(byval view as Matrix)
declare sub rlSetMatrixProjectionStereo(byval right as Matrix, byval left as Matrix)
declare sub rlSetMatrixViewOffsetStereo(byval right as Matrix, byval left as Matrix)
declare sub rlLoadDrawCube()
declare sub rlLoadDrawQuad()

end extern
