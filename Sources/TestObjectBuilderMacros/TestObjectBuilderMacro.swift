import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct TestObjectBuilderMacro: MemberMacro {
  private let parentTypeName: TokenSyntax
//  private let variables: [(variable: TokenSyntax,  type: TypeAnnotationSyntax)]
//  private let access: ModifierListSyntax.Element?
  
  public static func expansion(
    of node: AttributeSyntax,
    providingMembersOf declaration: some DeclGroupSyntax,
    in context: some MacroExpansionContext
  ) throws -> [DeclSyntax] {
    let macro = try TestObjectBuilderMacro(node: node, declaration: declaration, context: context)
    return [ macro.makeBuilderStruct() ]
  }
  
  init(node: AttributeSyntax, declaration: some DeclGroupSyntax, context: some MacroExpansionContext) throws {
    if let structDecl = declaration.as(StructDeclSyntax.self) {
      parentTypeName = structDecl.name.with(\.trailingTrivia, [])
    } else {
      parentTypeName = "egg"
    }
//      access = structDecl.modifiers?.first
//      
//      variables = declaration
//        .memberBlock
//        .members
//        .compactMap{$0.decl.as(VariableDeclSyntax.self)}
//        .flatMap(\.bindings)
//        .compactMap{ member -> (TokenSyntax, TypeAnnotationSyntax)? in
//          guard let identifier = member.pattern.as(IdentifierPatternSyntax.self)?.identifier,
//                let type = member.typeAnnotation
//          else {return nil}
//          return (identifier, type)
//        }
//      
//    } else if let classDecl = declaration.as(ClassDeclSyntax.self) {
//      parentTypeName = classDecl.identifier.with(\.trailingTrivia, [])
//      access = classDecl.modifiers?.first
//      variables = declaration
//        .memberBlock
//        .members
//        .compactMap{$0.decl.as(VariableDeclSyntax.self)}
//        .flatMap(\.bindings)
//        .compactMap{ member -> (TokenSyntax,  TypeAnnotationSyntax)? in
//          guard let identifier = member.pattern.as(IdentifierPatternSyntax.self)?.identifier,
//                let type = member.typeAnnotation
//          else {return nil}
//          return (identifier, type)
//        }
      
//    } else {
//      throw DiagnosticsError(diagnostics: [
//        BuilderMacroDiagnostic.notAStructOrClass(declaration).diagnose(at: Syntax(node))
//      ])
    }
  
  fileprivate func makeBuilderStruct() -> DeclSyntax {
//    let argList = variables.map(\.variable.text)
//    let funcSignature = variables.compactMap { id, type in
//      let defaultInstance = DefaultInstance.instanceRepresentation(rawValue:type)
//      return "\(id.text)\(type) = \(defaultInstance)"
//    }
//    \(raw: funcSignature.joined(separator: ",\n").description)
    return """
      public static func testInstance(
        
      ) -> \(parentTypeName) {
        .init()
      }
      """
  }
}




/*

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct TestObjectBuilder: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

 
  */
@main
struct TestObjectBuilderPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
      TestObjectBuilderMacro.self,
    ]
}

