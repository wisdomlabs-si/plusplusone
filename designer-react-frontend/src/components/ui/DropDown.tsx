import React from "react";
import Select from 'react-select';

type DropDownProps = {
    value: string;
    handleUpdate(value: string): void;
    options: Array<string>;
};

const DropDown: React.FC<DropDownProps> = ({  value, handleUpdate, options }) => {
    const makeOptions = (option: string ) => {
        return { value: option, label: option }
    }

    const handleKeyPress = (event: React.KeyboardEvent<HTMLInputElement>) => {
        if (event.code === "Enter" || event.code === "NumpadEnter") {
            event.stopPropagation();
        }
    };

    return (
        <div style={{ width: 155, marginLeft: 10 }}>
            <Select
                onKeyDown={handleKeyPress}
                className="basic-single"
                classNamePrefix="select"
                isSearchable= {true}
                options={options?.map(makeOptions)}
                value={makeOptions(String(value))}
                onChange={e => e ? handleUpdate(e.value.valueOf()) : null}
                autoFocus={true}
            />
        </div>
    );
};

export default DropDown;