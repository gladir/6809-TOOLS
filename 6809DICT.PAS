{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2021
  @website(https://www.gladir.com/6809-tools)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program _6809DICT;

Uses Strings;

Type
 Instr6809Rec=Record
  Name:String[3];
  Description:PChar;
  Syntax:PChar;
 End;

Const
 Instr6809:Array[0..71]of Instr6809Rec=(
  (Name:'ABA';
   Description:'Cette instruction permet d''ajouter l''adressage de registre '+
               'B dans l''adressage de registre A.';
   Syntax:'ABA'),
  (Name:'ADC';
   Description:'Cette instruction permet d''ajouter le contenu de la m‚moire '+
               'et le drapeau de retenue dans le registre accumulateur.';
   Syntax:'ADC A #data8'#13#10+
          'ADC A addr8'#13#10+
          'ADC A data8,X'#13#10+
          'ADC A addr16'#13#10+
          'ADC B #data8'#13#10+
          'ADC B addr8'#13#10+
          'ADC B data8,X'#13#10+
          'ADC B addr16'),
  (Name:'ADD';
   Description:'Cette instruction permet d''ajouter le contenu de la m‚moire '+
               'dans le registre accumulateur.';
   Syntax:'ADD A #data8'#13#10+
          'ADD A addr8'#13#10+
          'ADD A data8,X'#13#10+
          'ADD A addr16'#13#10+
          'ADD B #data8'#13#10+
          'ADD B addr8'#13#10+
          'ADD B data8,X'#13#10+
          'ADD B addr16'#13#10),
  (Name:'AND';
   Description:'Cette instruction permet d''effectuer un ®Et binaire¯ d''un '+
               'registre accumulateur avec op‚rande.';
   Syntax:'AND A #data8'#13#10+
          'AND A addr8'#13#10+
          'AND A data8,X'#13#10+
          'AND A addr16'#13#10+
          'AND B #data8'#13#10+
          'AND B addr8'#13#10+
          'AND B data8,X'#13#10+
          'AND B addr16'),
  (Name:'ASL';
   Description:'Cette instruction permet d''effectuer un d‚calage arithm‚tique '+
               'vers la gauche et fixe le bit 0 … 0.';
   Syntax:'ASL A'#13#10+
          'ASL B'#13#10+
          'ASL data8,X'#13#10+
          'ASL addr16'),
  (Name:'ASR';
   Description:'Cette instruction permet d''effectuer un d‚calage arithm‚tique '+
               'vers la droite et fixe le bit 7 avec le mˆme.';
   Syntax:'ASR A'#13#10+
          'ASR B'#13#10+
          'ASR data8,X'#13#10+
          'ASR addr16'),
  (Name:'BCC';
   Description:'Cette instruction permet d''effectuer un branchement si le '+
               'drapeau de retenue est effac‚.';
   Syntax:'BCC disp'),
  (Name:'BCS';
   Description:'Cette instruction permet d''effectuer un branchement si le '+
               'drapeau de retenue est fix‚.';
   Syntax:'BCS disp'),
  (Name:'BEQ';
   Description:'Cette instruction permet d''effectuer un branchement si ‚gale … z‚ro.';
   Syntax:'BEQ disp'),
  (Name:'BGE';
   Description:'Cette instruction permet d''effectuer un branchement si '+
               'sup‚rieur ou ‚gale … 0.';
   Syntax:'BGE disp'),
  (Name:'BGT';
   Description:'Cette instruction permet d''effectuer un branchement si '+
               'sup‚rieur … 0.';
   Syntax:'BGT disp'),
  (Name:'BHI';
   Description:'Cette instruction permet d''effectuer un branchement si le '+
               'contenu de l''accumulateur est sup‚rieur au compar‚.';
   Syntax:'BHI disp'),
  (Name:'BIT';
   Description:'Cette instruction permet d''effectuer un ®Et binaire¯ '+
               'avec l''accumulateur en changeant seulement le registre '+
               'd''‚tat.';
   Syntax:'BIT A #data8'#13#10+
          'BIT A addr8'#13#10+
          'BIT A data8,X'#13#10+
          'BIT A addr16'#13#10+
          'BIT B #data8'#13#10+
          'BIT B addr8'#13#10+
          'BIT B data8,X'#13#10+
          'BIT B addr16'),
  (Name:'BLE';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si inf‚rieur ou ‚gale … 0.';
   Syntax:'BLE disp'),
  (Name:'BLS';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si le contenu de l''accumulateur est inf‚rieur ou le '+
               'mˆme que le compar‚.';
   Syntax:'BLS disp'),
  (Name:'BLT';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si inf‚rieur … 0.';
   Syntax:'BLT disp'),
  (Name:'BMI';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si n‚gatif.';
   Syntax:'BMI disp'),
  (Name:'BNE';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si n''est pas ‚gale … 0.';
   Syntax:'BNE disp'),
  (Name:'BPL';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si positif.';
   Syntax:'BPL disp'),
  (Name:'BRA';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'inconditionnel relatif au contenu du registre PC (Program '+
               'Counter).';
   Syntax:'BRA disp'),
  (Name:'BSR';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'inconditionnel … la sous-routine situ‚ relativement '+
               'au contenu du registre PC (Program Counter).';
   Syntax:'BSR disp'),
  (Name:'BVC';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si le drapeau de d‚bordement est effac‚.';
   Syntax:'BVC disp'),
  (Name:'BVS';
   Description:'Cette instruction permet d''effectuer un branchement '+
               'si le drapeau de d‚bordement est fix‚.';
   Syntax:'BVS disp'),
  (Name:'CBA';
   Description:'Cette instruction permet de comparer le contenu des '+
               'registres accumulateurs A et B.';
   Syntax:'CBA'),
  (Name:'CLC';
   Description:'Cette instruction permet d''effacer le drapeau de '+
               'retenue.';
   Syntax:'CLC'),
  (Name:'CLI';
   Description:'Cette instruction permet d''effacer le drapeau '+
               'd''interruption et active les interruptions.';
   Syntax:'CLI'),
  (Name:'CLR';
   Description:'Cette instruction permet d''effacer l''op‚rande.';
   Syntax:'CLR A'#13#10+
          'CLR B'#13#10+
          'CLR data8,X'#13#10+
          'CLR addr16'),
  (Name:'CLV';
   Description:'Cette instruction permet d''effacer le drapeau de d‚bordement.';
   Syntax:'CLV'),
  (Name:'CMP';
   Description:'Cette instruction permet de comparer le contenu de la m‚moire '+
               'et de l''accumulateur.';
   Syntax:'CMP A #data8'#13#10+
          'CMP A addr8'#13#10+
          'CMP A data8,X'#13#10+
          'CMP A addr16'#13#10+
          'CMP B #data8'#13#10+
          'CMP B addr8'#13#10+
          'CMP B data8,X'#13#10+
          'CMP B addr16'#13#10),
  (Name:'COM';
   Description:'Cette instruction permet de calculer le compl‚ment de l''op‚rande.';
   Syntax:'COM A'#13#10+
          'COM B'#13#10+
          'COM data8,X'#13#10+
          'COM addr16'),
  (Name:'CPX';
   Description:'Cette instruction permet de comparer le contenu de la m‚moire '+
               'avec le registre d''index X.';
   Syntax:'CPX addr8'#13#10+
          'CPX data8,X'#13#10+
          'CPX #data16'#13#10+
          'CPX addr16'),
  (Name:'DAA';
   Description:'Cette instruction permet d''effectuer l''ajustement d‚cimal '+
               'du registre accumulateur A.';
   Syntax:'DAA'),
  (Name:'DEC';
   Description:'Cette instruction permet de d‚cr‚menter une op‚rande.';
   Syntax:'DEC A'#13#10+
          'DEC B'#13#10+
          'DEC data8,X'#13#10+
          'DEC addr16'),
  (Name:'DES';
   Description:'Cette instruction permet de d‚cr‚menter le pointeur de pile.';
   Syntax:'DES'),
  (Name:'DEX';
   Description:'Cette instruction permet de d‚cr‚menter le registre d''index X.';
   Syntax:'DEX'),
  (Name:'EOR';
   Description:'Cette instruction permet d''effectuer un ®Ou exclusif binaire¯ '+
               'd''un accumulateur avec le contenu de la m‚moire.';
   Syntax:'EOR A #data8'#13#10+
          'EOR A addr8'#13#10+
          'EOR A data8,X'#13#10+
          'EOR A addr16'#13#10+
          'EOR B #data8'#13#10+
          'EOR B addr8'#13#10+
          'EOR B data8,X'#13#10+
          'EOR B addr16'#13#10),
  (Name:'INC';
   Description:'Cette instruction permet d''incr‚menter une op‚rande.';
   Syntax:'INC A'#13#10+
          'INC B'#13#10+
          'INC data8,X'#13#10+
          'INC addr16'),
  (Name:'INS';
   Description:'Cette instruction permet d''incr‚menter le pointeur de pile.';
   Syntax:'INS'),
  (Name:'INX';
   Description:'Cette instruction permet d''incr‚menter le registre d''index X.';
   Syntax:'INX'),
  (Name:'JMP';
   Description:'Cette instruction permet de faire un branchement inconditionnel.';
   Syntax:'JMP data8,X'#13#10+
          'JMP addr16'),
  (Name:'JSR';
   Description:'Cette instruction permet de faire un saut … une sous-routine.';
   Syntax:'JSR data8,X'#13#10+
          'JSR addr16'),
  (Name:'LDA';
   Description:'Cette instruction permet de charger l''accumulateur en m‚moire.';
   Syntax:'LDA A #data8'#13#10+
          'LDA A addr8'#13#10+
          'LDA A data8,X'#13#10+
          'LDA A addr16'#13#10+
          'LDA B #data8'#13#10+
          'LDA B addr8'#13#10+
          'LDA B data8,X'#13#10+
          'LDA B addr16'),
  (Name:'LDS';
   Description:'Cette instruction permet de charger le pointeur de pile.';
   Syntax:'LDS addr8'#13#10+
          'LDS data8,X'#13#10+
          'LDS #data16'#13#10+
          'LDS addr16'),
  (Name:'LDX';
   Description:'Cette instruction permet de charger le registre d''index.';
   Syntax:'LDX addr8'#13#10+
          'LDX data8,X'#13#10+
          'LDX #data16'#13#10+
          'LDX addr16'),
  (Name:'LSR';
   Description:'Cette instruction permet d''effectuer un d‚calage logique vers '+
               'la gauche et le bit 7 est fix‚ … 0.';
   Syntax:'LSR A'#13#10+
          'LSR B'#13#10+
          'LSR data8,X'#13#10+
          'LSR addr16'),
  (Name:'NEG';
   Description:'Cette instruction permet d''effectuer une n‚gation de l''op‚rande.';
   Syntax:'NEG A'#13#10+
          'NEG B'#13#10+
          'NEG data8,X'#13#10+
          'NEG addr16'),
  (Name:'NOP';
   Description:'Cette instruction ne fait pas d''op‚ration.';
   Syntax:'NOP'),
  (Name:'ORA';
   Description:'Cette instruction permet d''effectuer un ®Ou binaire¯ d''un '+
               'accumulateur avec le contenu de la m‚moire.';
   Syntax:'ORA A #data8'#13#10+
          'ORA A addr8'#13#10+
          'ORA A data8,X'#13#10+
          'ORA A addr16'#13#10+
          'ORA B #data8'#13#10+
          'ORA B addr8'#13#10+
          'ORA B data8,X'#13#10+
          'ORA B addr16'),
  (Name:'PSH';
   Description:'Cette instruction permet d''empiler l''accumulateur dans la pile.';
   Syntax:'PSH A'#13#10+
          'PSH B'),
  (Name:'PUL';
   Description:'Cette instruction permet de d‚piler des donn‚es de la pile vers '+
               'l''accumulateur.';
   Syntax:'PUL A'#13#10+
          'PUL B'),
  (Name:'ROL';
   Description:'Cette instruction permet d''effectuer une rotation vers la gauche '+
               'dans le bit de retenue.';
   Syntax:'ROL A'#13#10+
          'ROL B'#13#10+
          'ROL data8,X'#13#10+
          'ROL addr16'),
  (Name:'ROR';
   Description:'Cette instruction permet d''effectuer une rotation vers la droite '+
               'dans le bit de retenue.';
   Syntax:'ROR A'#13#10+
          'ROR B'#13#10+
          'ROR data8,X'#13#10+
          'ROR addr16'),
  (Name:'RTI';
   Description:'Cette instruction permet de retourner d''une interruption.';
   Syntax:'RTI'),
  (Name:'RTS';
   Description:'Cette instruction permet de retourner d''une sous-routine.';
   Syntax:'RTS'),
  (Name:'SBA';
   Description:'Cette instruction permet de soustraire le contenu de '+
               'l''accumulateur B de l''accumulateur A.';
   Syntax:'SBA'),
  (Name:'SBC';
   Description:'Cette instruction permet de soustraire le contenu de la m‚moire '+
               'et du drapeau de retenue de l''accumulateur.';
   Syntax:'SBC A #data8'#13#10+
          'SBC A addr8'#13#10+
          'SBC A data8,X'#13#10+
          'SBC A addr16'#13#10+
          'SBC B #data8'#13#10+
          'SBC B addr8'#13#10+
          'SBC B data8,X'#13#10+
          'SBC B addr16'),
  (Name:'SEC';
   Description:'Cette instruction permet de fixer le drapeau de retenue.';
   Syntax:'SEC'),
  (Name:'SEI';
   Description:'Cette instruction permet de fixer le drapeau d''interruption '+
               'et d‚sactive les interruptions.';
   Syntax:'SEI'),
  (Name:'SEV';
   Description:'Cette instruction permet de fixer le drapeau de d‚bordement.';
   Syntax:'SEV'),
  (Name:'STA';
   Description:'Cette instruction permet d''entreposer l''accumulateur en m‚moire.';
   Syntax:'STA A addr8'#13#10+
          'STA A data8,X'#13#10+
          'STA A addr16'#13#10+
          'STA B addr8'#13#10+
          'STA B data8,X'#13#10+
          'STA B addr16'),
  (Name:'STS';
   Description:'Cette instruction permet d''entreposer le pointeur de pile.';
   Syntax:'STS addr8'#13#10+
          'STS data8,X'#13#10+
          'STS addr16'),
  (Name:'STX';
   Description:'Cette instruction permet d''entreposer le registre d''index X.';
   Syntax:'STX addr8'#13#10+
          'STX data8,X'#13#10+
          'STX addr16'),
  (Name:'SUB';
   Description:'Cette instruction permet de soustraire le contenu de la m‚moire '+
               'de l''accumulateur.';
   Syntax:'SUB A #data8'#13#10+
          'SUB A addr8'#13#10+
          'SUB A data8,X'#13#10+
          'SUB A addr16'#13#10+
          'SUB B #data8'#13#10+
          'SUB B addr8'#13#10+
          'SUB B data8,X'#13#10+
          'SUB B addr16'),
  (Name:'SWI';
   Description:'Cette instruction permet d''effectuer une interruption logiciel, '+
               'soit d''empiler les registres sur la pile, de d‚cr‚menter le '+
               'pointeur de pile et de sauter … la sous-routine d''interruption.';
   Syntax:'SWI'),
  (Name:'TAB';
   Description:'Cette instruction permet de transf‚rer le registre A vers registre B.';
   Syntax:'TAB'),
  (Name:'TAP';
   Description:'Cette instruction permet de transf‚rer le registre A vers le '+
               'registre d''‚tat.';
   Syntax:'TAP'),
  (Name:'TBA';
   Description:'Cette instruction permet de transf‚rer le registre B vers registre A.';
   Syntax:'TBA'),
  (Name:'TPA';
   Description:'Cette instruction permet de transf‚rer le registre d''‚tat vers '+
               'le registre A.';
   Syntax:'TPA'),
  (Name:'TST';
   Description:'Cette instruction permet d''effectuer un test de l''op‚rande.';
   Syntax:'TST A'#13#10+
          'TST B'#13#10+
          'TST data8,X'#13#10+
          'TST addr16'),
  (Name:'TSX';
   Description:'Cette instruction permet de copier le contenu du pointeur de pile '+
               'vers le registre d''index et de l''incr‚menter.';
   Syntax:'TSX'),
  (Name:'TXS';
   Description:'Cette instruction permet de copier le contenu du registre '+
               'd''index vers le pointeur de pile et de le d‚cr‚menter.';
   Syntax:'TXS'),
  (Name:'WAI';
   Description:'Cette instruction permet d''empiler les registres dans la pile, '+
               'de d‚cr‚menter le pointeur de pile et d''attendre aprŠs une interruption.';
   Syntax:'WAI')
 );

Var
 I,J:Integer;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('6809DICT : Cette commande permet d''afficher la liste des ',
           'instructions ou une instruction de l''assembleur 6809.');
  WriteLn;
  WriteLn('Syntaxe : 6809DICT [/LIST] [instruction]');
  WriteLn;
  WriteLN(' instruction   Affiche l''instruction sp‚cifi‚');
  WriteLn(' /LIST         Affiche la liste des instructions');
 End
  Else
 If ParamCount>0 Then Begin
  For I:=1 to ParamCount do Begin
   If StrToUpper(ParamStr(I))='/LIST'Then Begin
    For J:=Low(Instr6809)to High(Instr6809)do Begin
     WriteLn(PadRight(Instr6809[J].Name,10),StrPas(Instr6809[J].Description));
    End;
   End
    Else
   Begin
    For J:=Low(Instr6809)to High(Instr6809)do Begin
     If StrToUpper(ParamStr(I))=StrToUpper(Instr6809[J].Name)Then Begin
      WriteLn('Instruction : ');
      WriteLn;
      WriteLn(Instr6809[J].Name);
      WriteLn;
      WriteLn('Syntaxe : ');
      WriteLn;
      WriteLn(StrPas(Instr6809[J].Syntax));
      WriteLn;
      WriteLn('Description :');
      WriteLn;
      WriteLn(StrPas(Instr6809[J].Description));
     End;
    End;
   End;
  End;
 End
  Else
 WriteLn('ParamŠtre requis !');
END.
