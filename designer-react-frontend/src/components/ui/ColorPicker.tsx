import React, { useState, useRef, CSSProperties, useCallback } from "react";
import { HexColorPicker, HexColorInput } from "react-colorful";
import FlexBox from "./FlexBox";
import useClickOutside from "../../commonHelpers/useClickOutside";

type ColorPickerProps = {
  selectedColor: { key: string; value: string };
  handleUpdate(value: string): void;
};

const ColorPicker: React.FC<ColorPickerProps> = ({ selectedColor, handleUpdate }) => {
  const [showPicker, setShowPicker] = useState(false);
  const swatchStyle = {
    backgroundColor: selectedColor.value,
  };
  const clickHandler = () => setShowPicker(!showPicker);

  const elementRef = useRef<HTMLDivElement>(null);
  const pickerStyles: CSSProperties = {
    position: "fixed",
    zIndex: 100,
    left: elementRef.current?.getBoundingClientRect().x,
    top: elementRef.current?.getBoundingClientRect().bottom,
  };

  const popover = useRef<HTMLDivElement>(null);

  const close = useCallback(() => setShowPicker(false), []);
  useClickOutside(popover, close);

  return (
    <div className="c-ColorPicker">
      <FlexBox align="center" justify="start" className="c-ColorPicker__container">
        <div className="c-ColorPicker__swatch" style={swatchStyle} onClick={clickHandler} ref={elementRef} />
        <div className="c-ColorPicker__input">
          <HexColorInput color={selectedColor.value} onChange={(e: string) => handleUpdate(e)} />
        </div>
      </FlexBox>
      {showPicker && (
        <div ref={popover} className="c-ColorPicker__picker" style={pickerStyles}>
          <HexColorPicker color={selectedColor.value} onChange={(e: string) => handleUpdate(e)} />
        </div>
      )}
    </div>
  );
};

export default ColorPicker;
