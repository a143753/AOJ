// 入力
// - reader: &mut std::io::StdinLock:
// - 標準入力のロックされたハンドルを受け取ります。このハンドルを使って標準入力からデータを読み取ります。

// #### 出力
// - T:
// - 読み取った1行のデータを指定された型 T にパースした結果を返します。

// #### 詳細
// 1. 標準入力から1行を読み取ります。
// 2. 読み取った行全体を型 T にパースします。
// 3. パースされた値を返します。

// #### 制約
// - 型 T は std::str::FromStr トレイトを実装している必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。
fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
}

// 入力
// - reader: &mut std::io::StdinLock:
// - 標準入力のロックされたハンドルを受け取ります。このハンドルを使って標準入力からデータを読み取ります。

// #### 出力
// - Vec<T>:
// - 読み取った1行のデータを、空白で分割し、指定された型 T にパースした結果をベクターとして返します。

// #### 詳細
// 1. 標準入力から1行を読み取ります。
// 2. 読み取った行を空白で分割します。
// 3. 分割された各要素を型 T にパースします。
// 4. パースされた要素をベクターに収集し、そのベクターを返します。

// #### 制約
// - 型 T は std::str::FromStr トレイトを実装している必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}

// 入力
// - reader: &mut std::io::StdinLock:
// - 標準入力のロックされたハンドルを受け取ります。このハンドルを使って標準入力からデータを読み取ります。
// - n: i32:
// - 読み取る行数を指定します。

// #### 出力
// - Vec<Vec<T>>:
// - 読み取った複数行のデータを、各行ごとに空白で分割し、指定された型 T にパースした結果を2次元ベクターとして返します。

// #### 詳細
// 1. 標準入力から指定された行数 n を読み取ります。
// 2. 各行を空白で分割します。
// 3. 分割された各要素を型 T にパースします。
// 4. パースされた要素をベクターに収集し、そのベクターを2次元ベクターに追加します。
// 5. 最終的に2次元ベクターを返します。

// #### 制約
// - 型 T は std::str::FromStr トレイトを実装している必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。

fn read_matrix<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: i32) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut matrix = Vec::new();
    reader.lines().take(n as usize).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
        matrix.push(dt);
    });
    matrix
}
