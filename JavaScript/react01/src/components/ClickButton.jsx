function ClickButton() {
    const handleClick = () => {
        alert('¡Haz hecho click en el botón!');
    };

    return (
        <button onClick={handleClick}>
            Haz Click Aquí
        </button>
    );
}

export default ClickButton;
