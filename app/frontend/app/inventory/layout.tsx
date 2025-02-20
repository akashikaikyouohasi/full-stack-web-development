export default function InventoryLayout({
    children,
} : {
    children: React.ReactNode;
}) {
    return (
        <div className ="layout">
            <header className="header">ヘッダー</header>
            <div className="container">
                <aside className="navbar">サイドバー</aside>
                <main className="content">
                    <section>{children}</section>
                </main>
            </div>
            <footer className="footer">フッター</footer>
        </div>
    )
}