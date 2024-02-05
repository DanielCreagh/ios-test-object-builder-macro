// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Creates an extension for the annotated type and a builder class for constructing the type
@attached(member, names: named(TestObjectBuilder), named(testInstance))
public macro TestObjectBuilder() = #externalMacro(module: "TestObjectBuilderMacros", type: "TestObjectBuilderMacro")
