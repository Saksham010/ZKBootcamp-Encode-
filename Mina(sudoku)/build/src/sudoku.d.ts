import { Field, SmartContract, Bool, State } from 'snarkyjs';
export { Sudoku, SudokuZkApp };
declare const Sudoku_base: (new (value: {
    value: Field[][];
}) => {
    value: Field[][];
}) & {
    _isStruct: true;
} & import("snarkyjs/dist/node/snarky").ProvablePure<{
    value: Field[][];
}> & {
    toInput: (x: {
        value: Field[][];
    }) => {
        fields?: Field[] | undefined;
        packed?: [Field, number][] | undefined;
    };
    toJSON: (x: {
        value: Field[][];
    }) => {
        value: string[][];
    };
    fromJSON: (x: {
        value: string[][];
    }) => {
        value: Field[][];
    };
};
declare class Sudoku extends Sudoku_base {
    static from(value: number[][]): Sudoku;
    hash(): Field;
}
declare class SudokuZkApp extends SmartContract {
    sudokuHash: State<Field>;
    isSolved: State<Bool>;
    /**
     * by making this a `@method`, we ensure that a proof is created for the state initialization.
     * alternatively (and, more efficiently), we could have used `super.init()` inside `update()` below,
     * to ensure the entire state is overwritten.
     * however, it's good to have an example which tests the CLI's ability to handle init() decorated with `@method`.
     */
    init(): void;
    update(sudokuInstance: Sudoku): void;
    submitSolution(sudokuInstance: Sudoku, solutionInstance: Sudoku): void;
}
