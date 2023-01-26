import React, { useState } from "react";
import { MdArrowDropDown, MdEdit } from "react-icons/md";
import Button from "./Button";

type PropertyContainerProps = {
  title: string;
  children: React.ReactNode;
  editProps?(...args: any): void;
  isVisible: boolean;
  menu?: React.ReactNode;
};

const PropertyContainer: React.FC<PropertyContainerProps> = ({ children, title, editProps, isVisible, menu }) => {
  const [toggleSection, setToggleSection] = useState(isVisible);
  const toggleOnClick = () => {
    setToggleSection(!toggleSection);
  };

  const toggleClassName = toggleSection
    ? "c-Props__header-icon"
    : "c-Props__header-icon c-Props__header-icon--collapse";
  return (
    <section className={`c-Props${!toggleSection ? " c-Props--closed" : ""}`}>
      <header className="c-Props__header">
        <h2 onClick={toggleOnClick}>
          <span className={toggleClassName}>
            <MdArrowDropDown />
          </span>
          {title}
        </h2>
        {menu && toggleSection && menu}
        {editProps && <Button onClick={editProps} kind="ghost" icon={<MdEdit />} small />}
      </header>

      {toggleSection && children}
    </section>
  );
};

export default PropertyContainer;
