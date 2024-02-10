
import simd
import Crynon

//DevScene is just a test scene used in development
public class DevScene: Scene {
    
    let object = GameObject("Metamesh")
    let floor = RigidBody("floor")
    let grass = GameObject("Grass")
    let glass = GameObject("Window")
    let glassF = GameObject("WindowF")
    let glassH = GameObject("WindowH")
    let glass2 = GameObject("Window2")
    let glass3 = GameObject("Window3")
    let camera = DevCamera()
    let sun = DirectionalLight()
    let light = PointLight()
    let light2 = PointLight()
    let spotlight = Spotlight()
    let physics = RigidBody("physics")
    let physics2 = RigidBody("physics2")
    let skySphere = EnvironmentSphere("OceanSky")
    let shape = GameObject("Shape")
    let ssaoShape = GameObject("SSAOShape")
    
    var time: Float = 0.0
    
    public init() {
        super.init("BasicScene")
        addChild(object)
        addChild(glass)
        addChild(glassF)
        addChild(skySphere)
        addPhysicsObject(floor)
        addCamera(camera, true)
        addChild(grass)
        addChild(glass2)
        addChild(glassH)
        addPhysicsObject(physics)
        //addPhysicsObject(physics2)
        addLight(sun)
        addLight(light)
        light.addChild(light2)
        addLight(spotlight)
        object.setPosX(-4)
        object.material.shaderMaterial.emission = simd_float4(0.5, 0.3, 0.0, 0.9)
        object.material.shaderMaterial.color = simd_float4(0.5, 0.3, 0.0, 1.0)
        object.mesh = "Metamesh"
        floor.setPos(0, -5, -3)
        floor.setScale(10, 1, 10)
        floor.material.shaderMaterial.roughness = 1
        floor.material.shaderMaterial.color = simd_float4(0.2, 0.6, 0.0, 1.0)
        floor.isActive = false
        grass.setPos(6, -1.8, 2)
        grass.material.textureColor = "Grass"
        grass.material.shader = .Transparent
        grass.material.blendMode = .Alpha
        glass.setPos(5, -1.8, 5)
        glass.material.textureColor = "Window"
        glass.material.shaderMaterial.roughness = 0.0
        glass.material.shaderMaterial.backfaceNormals = true
        glassF.setPos(5, -1.8, 4)
        glassF.material.textureColor = "Window"
        glassF.material.shaderMaterial.roughness = 0.5
        glassF.material.shaderMaterial.backfaceNormals = true
        glassH.setPos(5, -1.8, 3)
        glassH.material.textureColor = "Window"
        glassH.material.shaderMaterial.roughness = 0.5
        glassH.material.shaderMaterial.backfaceNormals = true
        glass2.setPos(9, -1.5, 2)
        glass2.material.textureColor = "Window"
        glass2.material.shaderMaterial.backfaceNormals = true
        glass2.addChild(glass3)
        glass3.setPos(2, 0, 0)
        glass3.material.textureColor = "Window"
        glass3.material.shaderMaterial.backfaceNormals = true
        glassH.material.shader = .Transparent
        glassF.material.shader = .Transparent
        glass.material.shader = .Transparent
        glass2.material.shader = .Transparent
        glass3.material.shader = .Transparent
        glassH.material.blendMode = .Alpha
        glassF.material.blendMode = .Alpha
        glass.material.blendMode = .Alpha
        glass2.material.blendMode = .Alpha
        glass3.material.blendMode = .Alpha
        camera.setPosZ(5)
        physics.setPos(0, 0, -3, teleport: true)
        physics2.setPos(0.2, 3, -3, teleport: true)
        physics.addCollider("Sphere")
        physics2.addCollider("Sphere")
        floor.addCollider("Cube")
        physics.mesh = "Sphere"
        physics2.mesh = "Sphere"
        physics2.material.shaderMaterial.roughness = 0.1
        physics2.material.shader = .Transparent
        physics2.material.blendMode = .Alpha
        physics2.material.textureColor = "Window"
        sun.lightData.color = simd_float4(1,1,1,1)
        sun.setRotX(Float(45).deg2rad)
        sun.lightData.brightness = 0.8
        sun.direction = simd_float3(0, -1, 1)
        light.lightData.brightness = 1.0
        light.lightData.color = simd_float4(0, 1, 1, 1)
        spotlight.setPos(-15, 3, 0)
        spotlight.lightData.color = simd_float4(1,0,0,1)
        floor.material.visible = true
        skySphere.texture = "OceanSky"
        addChild(shape)
        shape.setPos(3, -4, 0)
        shape.mesh = "well"
        shape.material.textureColor = "well-diff"
        shape.material.textureNormal = "well-normal"
        shape.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        shape.material.shaderMaterial.roughness = 0.1
        addChild(ssaoShape)
        ssaoShape.setPos(1, -2, 1)
        ssaoShape.mesh = "SSAOObject"
        ssaoShape.material.textureColor = "WallpaperGreen"
        ssaoShape.setScale(0.5)
    }
    
    public override func tickCustom(_ deltaTime: Float) {
        time += deltaTime
        sun.direction = simd_float3(sin(time/5), -1, cos(time/5))
        light.setPosY(sin(time*2)*3+3)
        //shape.addRot(simd_float3(0, deltaTime/2, 0))
        spotlight.direction = simd_float3(0, sin(time), cos(time))
        glass2.setRotY(time)
    }
}
